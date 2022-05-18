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
using ZR.Model.Blog;

namespace ZR.Service.Blog
{
    /// <summary>
    /// 文章类型Service业务层处理
    ///
    /// @author ztc
    /// @date 2022-03-30
    /// </summary>
    [AppService(ServiceType = typeof(IArticlecategoryService), ServiceLifetime = LifeTime.Transient)]
    public class ArticlecategoryService : BaseService<ArticleCategory>, IArticlecategoryService
    {
        private readonly ArticlecategoryRepository _Articlecategoryrepository;
        public ArticlecategoryService(ArticlecategoryRepository repository) : base(repository)
        {
            _Articlecategoryrepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询文章类型列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<ArticleCategory> GetList(ArticlecategoryQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<ArticleCategory>();

            //搜索条件查询语法参考Sqlsugar
            var response = _Articlecategoryrepository
                .GetPages(predicate.ToExpression(), parm, it => it.Category_Id, "desc");
            return response;
        }
        #endregion
    }
}