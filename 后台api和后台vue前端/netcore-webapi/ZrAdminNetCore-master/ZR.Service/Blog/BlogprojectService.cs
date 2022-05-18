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
    /// 博客项目表Service业务层处理
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    [AppService(ServiceType = typeof(IBlogprojectService), ServiceLifetime = LifeTime.Transient)]
    public class BlogprojectService : BaseService<Blogproject>, IBlogprojectService
    {
        private readonly BlogprojectRepository _Blogprojectrepository;
        public BlogprojectService(BlogprojectRepository repository) : base(repository)
        {
            _Blogprojectrepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询博客项目表列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<Blogproject> GetList(BlogprojectQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<Blogproject>();

            //搜索条件查询语法参考Sqlsugar
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Title), it => it.Title.Contains(parm.Title));
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.TypeName), it => it.TypeName == parm.TypeName);
            var response = _Blogprojectrepository
                .Queryable()
                .Where(predicate.ToExpression())
                .ToPage(parm);
            return response;
        }

        #endregion
    }
}