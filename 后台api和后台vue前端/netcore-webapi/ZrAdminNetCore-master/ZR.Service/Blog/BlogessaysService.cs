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
    /// 随笔管理Service业务层处理
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [AppService(ServiceType = typeof(IBlogessaysService), ServiceLifetime = LifeTime.Transient)]
    public class BlogessaysService : BaseService<Blogessays>, IBlogessaysService
    {
        private readonly BlogessaysRepository _Blogessaysrepository;
        public BlogessaysService(BlogessaysRepository repository) : base(repository)
        {
            _Blogessaysrepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询随笔管理列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<Blogessays> GetList(BlogessaysQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<Blogessays>();

            //搜索条件查询语法参考Sqlsugar
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Title), it => it.Title.Contains(parm.Title));
            var response = _Blogessaysrepository
                .GetPages(predicate.ToExpression(), parm, it => it.CreateTime, "desc");
            return response;
        }

        #endregion
    }
}