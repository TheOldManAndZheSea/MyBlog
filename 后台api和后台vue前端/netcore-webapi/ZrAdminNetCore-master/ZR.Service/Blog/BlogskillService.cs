using Infrastructure;
using Infrastructure.Attribute;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using ZR.Repository;
using ZR.Service.Blog.IBlogService;
using System;
using SqlSugar;
using System.Collections.Generic;

namespace ZR.Service.Blog
{
    /// <summary>
    /// 博客个人技能Service业务层处理
    ///
    /// @author ztc
    /// @date 2022-03-31
    /// </summary>
    [AppService(ServiceType = typeof(IBlogskillService), ServiceLifetime = LifeTime.Transient)]
    public class BlogskillService : BaseService<Blogskill>, IBlogskillService
    {
        private readonly BlogskillRepository _Blogskillrepository;
        public BlogskillService(BlogskillRepository repository) : base(repository)
        {
            _Blogskillrepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询博客个人技能列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<Blogskill> GetList(BlogskillQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<Blogskill>();

            //搜索条件查询语法参考Sqlsugar
            var response = _Blogskillrepository
                .Queryable()
                .Where(predicate.ToExpression())
                .ToPage(parm);
            return response;
        }

        #endregion
    }
}