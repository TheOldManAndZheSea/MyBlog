using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;

namespace ZR.Repository
{
    /// <summary>
    /// 博客友情链接仓储
    ///
    /// @author ztc
    /// @date 2022-04-13
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class BloglinksRepository : BaseRepository<Bloglinks>
    {
        #region 业务逻辑代码
        #endregion
    }
}