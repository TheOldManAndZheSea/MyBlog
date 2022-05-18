using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;

namespace ZR.Repository
{
    /// <summary>
    /// 博客前台配置表信息修改仓储
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class BlogconfigRepository : BaseRepository<Blogconfig>
    {
        #region 业务逻辑代码
        #endregion
    }
}