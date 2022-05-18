using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;

namespace ZR.Repository
{
    /// <summary>
    /// 博客项目表仓储
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class BlogprojectRepository : BaseRepository<Blogproject>
    {
        #region 业务逻辑代码
        #endregion
    }
}