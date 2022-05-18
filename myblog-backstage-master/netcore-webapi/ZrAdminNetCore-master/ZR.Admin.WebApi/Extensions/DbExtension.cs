﻿using Infrastructure;
using Microsoft.Extensions.Configuration;
using SqlSugar;
using SqlSugar.IOC;
using System;
using System.Collections.Generic;
using System.Linq;
using ZR.Admin.WebApi.Framework;
using ZR.Model.System;

namespace ZR.Admin.WebApi.Extensions
{
    public static class DbExtension
    {
        private static NLog.Logger logger = NLog.LogManager.GetCurrentClassLogger();
        //全部数据权限
        public static string DATA_SCOPE_ALL = "1";
        //自定数据权限
        public static string DATA_SCOPE_CUSTOM = "2";
        //仅本人数据权限
        public static string DATA_SCOPE_SELF = "5";

        public static void AddDb(IConfiguration Configuration)
        {
            string connStr = Configuration.GetConnectionString(OptionsSetting.ConnAdmin);
            string connStrBus = Configuration.GetConnectionString(OptionsSetting.ConnBus);
            string dbKey = Configuration[OptionsSetting.DbKey];
            int dbType = Convert.ToInt32(Configuration[OptionsSetting.ConnDbType]);
            int dbType_bus = Convert.ToInt32(Configuration[OptionsSetting.ConnBusDbType]);

            SugarIocServices.AddSqlSugar(new List<IocConfig>() {
               new IocConfig() {
                ConfigId = "0",
                ConnectionString = connStr,
                DbType = (IocDbType)dbType,
                IsAutoCloseConnection = true
            }, new IocConfig() {
                ConfigId = "1",
                ConnectionString = connStrBus,
                DbType = (IocDbType)dbType_bus,
                IsAutoCloseConnection = true
            }
            });
            //每次Sql执行前事件            
            DbScoped.SugarScope.GetConnection(0).Aop.OnLogExecuting = (sql, pars) =>
            {
                var param = DbScoped.SugarScope.Utilities.SerializeObject(pars.ToDictionary(it => it.ParameterName, it => it.Value));

                FilterData();

                logger.Info($"{sql}，{param}");
            };
            //出错打印日志
            DbScoped.SugarScope.GetConnection(0).Aop.OnError = (e) =>
            {
                logger.Error(e, $"执行SQL出错：{e.Message}");
            };
            //SQL执行完
            DbScoped.SugarScope.GetConnection(0).Aop.OnLogExecuted = (sql, pars) =>
            {
                //执行完了可以输出SQL执行时间 (OnLogExecutedDelegate) 
            };
            //Db1
            DbScoped.SugarScope.GetConnection(1).Aop.OnLogExecuting = (sql, pars) =>
            {
                var param = DbScoped.SugarScope.Utilities.SerializeObject(pars.ToDictionary(it => it.ParameterName, it => it.Value));

                logger.Info($"Sql语句：{sql}, {param}");
            };
            //Db1错误日志
            DbScoped.SugarScope.GetConnection(1).Aop.OnError = (e) =>
            {
                logger.Error($"执行Sql语句失败：{e.Sql}，原因：{e.Message}");
            };
        }

        /// <summary>
        /// 分页获取count 不会追加sql
        /// </summary>
        private static void FilterData()
        {
            var u = App.User;
            if (u == null) return;
            //获取当前用户的信息
            var user = JwtUtil.GetLoginUser(App.HttpContext);
            if (user == null) return;
            //管理员不过滤
            if (user.RoleIds.Any(f => f.Equals("admin"))) return;

            foreach (var role in user.Roles)
            {
                string dataScope = role.DataScope;
                if (DATA_SCOPE_ALL.Equals(dataScope))//所有权限
                {
                    break;
                }
                else if (DATA_SCOPE_CUSTOM.Equals(dataScope))//自定数据权限
                {
                    //有问题
                    //var roleDepts = db0.Queryable<SysRoleDept>()
                    //.Where(f => f.RoleId == role.RoleId).Select(f => f.DeptId).ToList();
                    //var filter1 = new TableFilterItem<SysDept>(it => roleDepts.Contains(it.DeptId));
                    //DbScoped.SugarScope.GetConnection(0).QueryFilter.Add(filter1);
                }
                else if (DATA_SCOPE_SELF.Equals(dataScope))//仅本人数据
                {
                    var filter1 = new TableFilterItem<SysUser>(it => it.UserId == user.UserId);
                    DbScoped.SugarScope.GetConnection(0).QueryFilter.Add(filter1);
                }
            }
        }
    }
}
