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
    /// 博客友情链接Service业务层处理
    ///
    /// @author ztc
    /// @date 2022-04-13
    /// </summary>
    [AppService(ServiceType = typeof(IBloglinksService), ServiceLifetime = LifeTime.Transient)]
    public class BloglinksService : BaseService<Bloglinks>, IBloglinksService
    {
        private readonly BloglinksRepository _Bloglinksrepository;
        public BloglinksService(BloglinksRepository repository) : base(repository)
        {
            _Bloglinksrepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询博客友情链接列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<Bloglinks> GetList(BloglinksQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<Bloglinks>();

            //搜索条件查询语法参考Sqlsugar
            var response = _Bloglinksrepository
                .Queryable()
                .Where(predicate.ToExpression())
                .ToPage(parm);
            return response;
        }

        #endregion
    }
}