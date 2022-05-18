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
    /// 随笔管理Controller
    ///
    /// @author ztc
    /// @date 2022-03-25
    /// </summary>
    [Verify]
    [Route("blog/TBlogessays")]
    public class BlogessaysController : BaseController
    {
        /// <summary>
        /// 随笔管理接口
        /// </summary>
        private readonly IBlogessaysService _BlogessaysService;

        public BlogessaysController(IBlogessaysService BlogessaysService)
        {
            _BlogessaysService = BlogessaysService;
        }

        /// <summary>
        /// 查询随笔管理列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("list")]
        [AllowAnonymousAttribute]
        [ActionPermissionFilter(Permission = "blog:blogessays:list")]
        public IActionResult QueryBlogessays([FromQuery] BlogessaysQueryDto parm)
        {
            var response = _BlogessaysService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询随笔管理详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("{Id}")]
        [ActionPermissionFilter(Permission = "blog:blogessays:query")]
        public IActionResult GetBlogessays(int Id)
        {
            var response = _BlogessaysService.GetFirst(x => x.Id == Id);
            
            return SUCCESS(response);
        }

        /// <summary>
        /// 添加随笔管理
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionPermissionFilter(Permission = "blog:blogessays:add")]
        [Log(Title = "随笔管理", BusinessType = BusinessType.INSERT)]
        public IActionResult AddBlogessays([FromBody] BlogessaysDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<Blogessays>().ToCreate(HttpContext);

            var response = _BlogessaysService.Insert(modal, it => new
            {
                it.Title,
                it.Color,
                it.Content,
                it.CreateTime,
                it.AuthorName,
            });
            return ToResponse(response);
        }

        /// <summary>
        /// 更新随笔管理
        /// </summary>
        /// <returns></returns>
        [HttpPut]
        [ActionPermissionFilter(Permission = "blog:blogessays:edit")]
        [Log(Title = "随笔管理", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateBlogessays([FromBody] BlogessaysDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<Blogessays>().ToUpdate(HttpContext);

            var response = _BlogessaysService.Update(w => w.Id == modal.Id, it => new Blogessays()
            {
                //Update 字段映射
                Title = modal.Title,
                Color = modal.Color,
                Content = modal.Content,
                CreateTime = modal.CreateTime,
                AuthorName = modal.AuthorName,
            });

            return ToResponse(response);
        }

        /// <summary>
        /// 删除随笔管理
        /// </summary>
        /// <returns></returns>
        [HttpDelete("{ids}")]
        [ActionPermissionFilter(Permission = "blog:blogessays:delete")]
        [Log(Title = "随笔管理", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteBlogessays(string ids)
        {
            int[] idsArr = Tools.SpitIntArrary(ids);
            if (idsArr.Length <= 0) { return ToResponse(ApiResult.Error($"删除失败Id 不能为空")); }

            var response = _BlogessaysService.Delete(idsArr);

            return ToResponse(response);
        }


    }
}