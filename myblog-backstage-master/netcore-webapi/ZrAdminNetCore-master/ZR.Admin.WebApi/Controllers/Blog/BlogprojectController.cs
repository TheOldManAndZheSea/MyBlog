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
    /// 博客项目表Controller
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    [Verify]
    [Route("Blog/TBlogproject")]
    public class BlogprojectController : BaseController
    {
        /// <summary>
        /// 博客项目表接口
        /// </summary>
        private readonly IBlogprojectService _BlogprojectService;

        public BlogprojectController(IBlogprojectService BlogprojectService)
        {
            _BlogprojectService = BlogprojectService;
        }

        /// <summary>
        /// 查询博客项目表列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("list")]
        [AllowAnonymousAttribute]
        [ActionPermissionFilter(Permission = "blog:blogproject:list")]
        public IActionResult QueryBlogproject([FromQuery] BlogprojectQueryDto parm)
        {
            var response = _BlogprojectService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询博客项目表详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("{Id}")]
        [ActionPermissionFilter(Permission = "blog:blogproject:query")]
        public IActionResult GetBlogproject(int Id)
        {
            var response = _BlogprojectService.GetFirst(x => x.Id == Id);
            
            return SUCCESS(response);
        }

        /// <summary>
        /// 添加博客项目表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionPermissionFilter(Permission = "blog:blogproject:add")]
        [Log(Title = "博客项目表", BusinessType = BusinessType.INSERT)]
        public IActionResult AddBlogproject([FromBody] BlogprojectDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<Blogproject>().ToCreate(HttpContext);

            var response = _BlogprojectService.Insert(modal, it => new
            {
                it.Content,
                it.Title,
                it.TypeName,
                it.PicUrl,
                it.Techs,
                it.Url,
            });
            return ToResponse(response);
        }

        /// <summary>
        /// 更新博客项目表
        /// </summary>
        /// <returns></returns>
        [HttpPut]
        [ActionPermissionFilter(Permission = "blog:blogproject:edit")]
        [Log(Title = "博客项目表", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateBlogproject([FromBody] BlogprojectDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<Blogproject>().ToUpdate(HttpContext);

            var response = _BlogprojectService.Update(w => w.Id == modal.Id, it => new Blogproject()
            {
                //Update 字段映射
                Content = modal.Content,
                Title = modal.Title,
                TypeName = modal.TypeName,
                PicUrl = modal.PicUrl,
                Techs = modal.Techs,
                Url = modal.Url,
            });

            return ToResponse(response);
        }

        /// <summary>
        /// 删除博客项目表
        /// </summary>
        /// <returns></returns>
        [HttpDelete("{ids}")]
        [ActionPermissionFilter(Permission = "blog:blogproject:delete")]
        [Log(Title = "博客项目表", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteBlogproject(string ids)
        {
            int[] idsArr = Tools.SpitIntArrary(ids);
            if (idsArr.Length <= 0) { return ToResponse(ApiResult.Error($"删除失败Id 不能为空")); }

            var response = _BlogprojectService.Delete(idsArr);

            return ToResponse(response);
        }


    }
}