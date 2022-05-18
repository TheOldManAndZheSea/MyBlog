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
    /// 博客个人信息Service业务层处理
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    [AppService(ServiceType = typeof(IBlogpersonalinfoService), ServiceLifetime = LifeTime.Transient)]
    public class BlogpersonalinfoService : BaseService<Blogpersonalinfo>, IBlogpersonalinfoService
    {
        private readonly BlogpersonalinfoRepository _Blogpersonalinforepository;
        public BlogpersonalinfoService(BlogpersonalinfoRepository repository) : base(repository)
        {
            _Blogpersonalinforepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询博客个人信息列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<Blogpersonalinfo> GetList(BlogpersonalinfoQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<Blogpersonalinfo>();

            //搜索条件查询语法参考Sqlsugar
            var response = _Blogpersonalinforepository
                .Queryable()
                .Where(predicate.ToExpression())
                .ToPage(parm);
            return response;
        }

        #endregion
    }
}