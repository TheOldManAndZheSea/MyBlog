using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;
using ZR.Model.Blog;

namespace ZR.Service.Blog.IBlogService
{
    /// <summary>
    /// 文章类型service接口
    ///
    /// @author ztc
    /// @date 2022-03-30
    /// </summary>
    public interface IArticlecategoryService : IBaseService<ArticleCategory>
    {
        PagedInfo<ArticleCategory> GetList(ArticlecategoryQueryDto parm);

    }
}
