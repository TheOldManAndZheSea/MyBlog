using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Blog.IBlogService
{
    /// <summary>
    /// 博客项目表service接口
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    public interface IBlogprojectService : IBaseService<Blogproject>
    {
        PagedInfo<Blogproject> GetList(BlogprojectQueryDto parm);

    }
}
