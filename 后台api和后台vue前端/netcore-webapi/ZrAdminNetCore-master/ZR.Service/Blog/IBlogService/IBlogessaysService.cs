using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Blog.IBlogService
{
    /// <summary>
    /// 随笔管理service接口
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    public interface IBlogessaysService : IBaseService<Blogessays>
    {
        PagedInfo<Blogessays> GetList(BlogessaysQueryDto parm);

    }
}
