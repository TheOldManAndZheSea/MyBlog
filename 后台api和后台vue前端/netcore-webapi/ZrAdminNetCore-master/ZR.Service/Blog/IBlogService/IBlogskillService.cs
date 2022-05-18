using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Blog.IBlogService
{
    /// <summary>
    /// 博客个人技能service接口
    ///
    /// @author ztc
    /// @date 2022-03-31
    /// </summary>
    public interface IBlogskillService : IBaseService<Blogskill>
    {
        PagedInfo<Blogskill> GetList(BlogskillQueryDto parm);

    }
}
