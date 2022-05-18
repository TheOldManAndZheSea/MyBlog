using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;

namespace ZR.Repository
{
    /// <summary>
    /// 随笔管理仓储
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class BlogessaysRepository : BaseRepository<Blogessays>
    {
        #region 业务逻辑代码
        #endregion
    }
}