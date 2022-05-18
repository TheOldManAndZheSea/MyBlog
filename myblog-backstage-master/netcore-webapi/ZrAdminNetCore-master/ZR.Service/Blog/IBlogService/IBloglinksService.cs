using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Blog.IBlogService
{
    /// <summary>
    /// 博客友情链接service接口
    ///
    /// @author ztc
    /// @date 2022-04-13
    /// </summary>
    public interface IBloglinksService : IBaseService<Bloglinks>
    {
        PagedInfo<Bloglinks> GetList(BloglinksQueryDto parm);

    }
}
