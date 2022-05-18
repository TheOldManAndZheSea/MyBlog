using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Infrastructure;
using Infrastructure.Attribute;
using Infrastructure.Enums;
using Infrastructure.Model;
using Mapster;
using ZR.Model.Dto;
using ZR.Model.Models;
using ZR.Service.Blog.IBlogService;
using ZR.Admin.WebApi.Extensions;
using ZR.Admin.WebApi.Filters;
using ZR.Common;
using Infrastructure.Extensions;
using System.Linq;
using Microsoft.AspNetCore.Authorization;

namespace ZR.Admin.WebApi.Controllers
{
    /// <summary>
    /// 博客前台配置表信息修改Controller
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [Verify]
    [Route("Blog/TBlogconfig")]
    public class BlogconfigController : BaseController
    {
        /// <summary>
        /// 博客前台配置表信息修改接口
        /// </summary>
        private readonly IBlogconfigService _BlogconfigService;
        private readonly IBloglinksService _bloglinksService;

        public BlogconfigController(IBlogconfigService BlogconfigService, IBloglinksService bloglinksService)
        {
            _BlogconfigService = BlogconfigService;
            _bloglinksService = bloglinksService;
        }

        #region 博客友情链接
        /// <summary>
        /// 查询博客友情链接
        /// </summary>
        /// <returns></returns>
        [HttpGet("getLinks")]
        [AllowAnonymousAttribute]
        [ActionPermissionFilter(Permission = "blog:bloglinks:list")]
        public IActionResult GetBloglinks()
        {
            var response = _bloglinksService.GetAll();

            return SUCCESS(response);
        }
        [HttpGet("getLinksQuery/{id}")]
        [AllowAnonymousAttribute]
        [ActionPermissionFilter(Permission = "blog:bloglinks:query")]
        public IActionResult GetBlogconfig(int id)
        {
            var response = _bloglinksService.GetFirst(s => s.Id == id);

            return SUCCESS(response);
        }
        /// <summary>
        /// 博客友情链接添加
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpPost("addLinks")]
        [ActionPermissionFilter(Permission = "blog:bloglinks:add")]
        [Log(Title = "博客友情链接添加", BusinessType = BusinessType.INSERT)]
        public IActionResult InsertBloglinks([FromBody] BloglinksDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            var modal = parm.Adapt<Bloglinks>().ToCreate(HttpContext);

            var response = _bloglinksService.Add(modal);
            return SUCCESS(response);
        }
        /// <summary>
        /// 博客友情链接添加
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpPut("editLinks")]
        [ActionPermissionFilter(Permission = "blog:bloglinks:edit")]
        [Log(Title = "博客友情链接修改", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateBloglinks([FromBody] Bloglinks parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            var response = _bloglinksService.Update(parm);

            return SUCCESS(response);
        }
        /// <summary>
        /// 删除随笔管理
        /// </summary>
        /// <returns></returns>
        [HttpDelete("delLinks/{id}")]
        [ActionPermissionFilter(Permission = "blog:bloglinks:delete")]
        [Log(Title = "博客友情链接删除", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteBlogLinks(int id)
        {
            if (id==0)
            {
                throw new CustomException("请求参数不能为null");
            }
            var response = _bloglinksService.Delete(id);

            return ToResponse(response);
        }
        #endregion

        #region 博客配置
        /// <summary>
        /// 查询博客前台配置表信息修改详情
        /// </summary>
        /// <returns></returns>
        [HttpGet("getQuery")]
        [AllowAnonymousAttribute]
        [ActionPermissionFilter(Permission = "blog:blogconfig:query")]
        public IActionResult GetBlogconfig()
        {
            var response = _BlogconfigService.GetFirst(s => s.Id == 1);

            return SUCCESS(response);
        }


        [HttpPut("edit")]
        [ActionPermissionFilter(Permission = "blog:blogconfig:edit")]
        [Log(Title = "博客配置修改", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateBlogconfig([FromBody] Blogconfig parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var addModel = parm.Adapt<Blogconfig>().ToCreate(context: HttpContext);
            var response = _BlogconfigService.Update(addModel);
            return SUCCESS(response);
        }
        #endregion


    }
}