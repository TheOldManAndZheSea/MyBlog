using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;
using ZR.Model.Blog;

namespace ZR.Repository
{
    /// <summary>
    /// 文章类型仓储
    ///
    /// @author ztc
    /// @date 2022-03-30
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class ArticlecategoryRepository : BaseRepository<ArticleCategory>
    {
        #region 业务逻辑代码
        #endregion
    }
}