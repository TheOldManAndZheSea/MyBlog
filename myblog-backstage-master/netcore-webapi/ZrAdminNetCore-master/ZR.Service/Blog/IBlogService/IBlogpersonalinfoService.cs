using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Blog.IBlogService
{
    /// <summary>
    /// 博客个人信息service接口
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    public interface IBlogpersonalinfoService : IBaseService<Blogpersonalinfo>
    {
        PagedInfo<Blogpersonalinfo> GetList(BlogpersonalinfoQueryDto parm);

    }
}
