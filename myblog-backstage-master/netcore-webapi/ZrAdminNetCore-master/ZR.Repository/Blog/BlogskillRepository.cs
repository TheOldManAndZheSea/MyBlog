using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;

namespace ZR.Repository
{
    /// <summary>
    /// 博客个人技能仓储
    ///
    /// @author ztc
    /// @date 2022-03-31
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class BlogskillRepository : BaseRepository<Blogskill>
    {
        #region 业务逻辑代码
        #endregion
    }
}