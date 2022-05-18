using Infrastructure;
using Infrastructure.Attribute;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using ZR.Repository;
using ZR.Service.Blog.IBlogService;
using System;
using SqlSugar;
using System.Collections.Generic;

namespace ZR.Service.Blog
{
    /// <summary>
    /// 博客前台配置表信息修改Service业务层处理
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [AppService(ServiceType = typeof(IBlogconfigService), ServiceLifetime = LifeTime.Transient)]
    public class BlogconfigService : BaseService<Blogconfig>, IBlogconfigService
    {
        private readonly BlogconfigRepository _Blogconfigrepository;
        public BlogconfigService(BlogconfigRepository repository) : base(repository)
        {
            _Blogconfigrepository = repository;
        }
    }
}