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
    /// 博客个人信息Controller
    ///
    /// @author ztc
    /// @date 2022-03-29
    /// </summary>
    [Verify]
    [Route("Blog/TBlogpersonalinfo")]
    public class BlogpersonalinfoController : BaseController
    {
        /// <summary>
        /// 博客个人信息接口
        /// </summary>
        private readonly IBlogpersonalinfoService _BlogpersonalinfoService;
        /// <summary>
        /// 博客个人技能接口
        /// </summary>
        private readonly IBlogskillService _BlogskillService;

        public BlogpersonalinfoController(IBlogpersonalinfoService BlogpersonalinfoService,IBlogskillService BlogskillService)
        {
            _BlogpersonalinfoService = BlogpersonalinfoService;
            _BlogskillService = BlogskillService;
        }

        /// <summary>
        /// 查询博客个人信息列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("list")]
        [ActionPermissionFilter(Permission = "blog:blogpersonalinfo:list")]
        public IActionResult QueryBlogpersonalinfo([FromQuery] BlogpersonalinfoQueryDto parm)
        {
            var response = _BlogpersonalinfoService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询博客个人信息详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("{Id}")]
        [AllowAnonymousAttribute]
        [ActionPermissionFilter(Permission = "blog:blogpersonalinfo:query")]
        public IActionResult GetBlogpersonalinfo(int Id)
        {
            var response = _BlogpersonalinfoService.GetFirst(x => x.Id == Id);

            return SUCCESS(response);
        }

        /// <summary>
        /// 更新博客个人信息详情
        /// </summary>
        /// <returns></returns>
        [HttpPut("edit")]
        [ActionPermissionFilter(Permission = "blog:blogpersonalinfo:edit")]
        [Log(Title = "博客个人信息详情管理", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateBlogpersonalinfo([FromBody] dynamic parm)
        {
            var ppp= Newtonsoft.Json.JsonConvert.DeserializeObject<Blogpersonalinfo>(Convert.ToString(parm));
            if (ppp == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            //var modal = parm.Adapt<Blogpersonalinfo>().ToUpdate(HttpContext);

            //var response = _BlogpersonalinfoService.Update(w => w.Id == modal.Id, it => new Blogpersonalinfo()
            //{
            //    //Update 字段映射
            //    Age = modal.Age,
            //    Avatar = modal.Avatar,
            //    Birthday = modal.Birthday,
            //    Blood = modal.Blood,
            //    CSDNUrl = modal.CSDNUrl,
            //    Degree = modal.Degree,
            //    Email = modal.Email,
            //    GiteeUrl = modal.GiteeUrl,
            //    GitHubUrl = modal.GitHubUrl,
            //    Height = modal.Height,
            //    Name = modal.Name,
            //    School = modal.School,
            //    Sex = modal.Sex,
            //    Specialized = modal.Specialized,
            //    Weight = modal.Weight

            //});
            //var addModel = ppp.Adapt<Blogpersonalinfo>().ToCreate(context: HttpContext);
            var response = _BlogpersonalinfoService.Update(ppp);
            return SUCCESS(response);
        }

        #region 博客技能
        /// <summary>
        /// 查询博客个人技能列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("skill/list")]
        [ActionPermissionFilter(Permission = "blog:blogskill:list"), AllowAnonymousAttribute]
        public IActionResult QueryBlogskill([FromQuery] BlogskillQueryDto parm)
        {
            var response = _BlogskillService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询博客个人技能详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("skill/{Id}")]
        [ActionPermissionFilter(Permission = "blog:blogskill:query")]
        public IActionResult GetBlogskill(int Id)
        {
            var response = _BlogskillService.GetFirst(x => x.Id == Id);

            return SUCCESS(response);
        }

        /// <summary>
        /// 添加博客个人技能
        /// </summary>
        /// <returns></returns>
        [HttpPost("skill/add")]
        [ActionPermissionFilter(Permission = "blog:blogskill:add")]
        [Log(Title = "博客个人技能", BusinessType = BusinessType.INSERT)]
        public IActionResult AddBlogskill([FromBody] BlogskillDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<Blogskill>().ToCreate(HttpContext);

            var response = _BlogskillService.Insert(modal, it => new
            {
                it.Name,
                it.PicIcon,
                it.Des,
            });
            return ToResponse(response);
        }

        /// <summary>
        /// 更新博客个人技能
        /// </summary>
        /// <returns></returns>
        [HttpPut("skill/edit")]
        [ActionPermissionFilter(Permission = "blog:blogskill:edit")]
        [Log(Title = "博客个人技能", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateBlogskill([FromBody] BlogskillDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<Blogskill>().ToUpdate(HttpContext);

            var response = _BlogskillService.Update(w => w.Id == modal.Id, it => new Blogskill()
            {
                //Update 字段映射
                Name = modal.Name,
                PicIcon = modal.PicIcon,
                Des = modal.Des,
            });

            return ToResponse(response);
        }

        /// <summary>
        /// 删除博客个人技能
        /// </summary>
        /// <returns></returns>
        [HttpDelete("skill/del/{ids}")]
        [ActionPermissionFilter(Permission = "blog:blogskill:delete")]
        [Log(Title = "博客个人技能", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteBlogskill(string ids)
        {
            int[] idsArr = Tools.SpitIntArrary(ids);
            if (idsArr.Length <= 0) { return ToResponse(ApiResult.Error($"删除失败Id 不能为空")); }

            var response = _BlogskillService.Delete(idsArr);

            return ToResponse(response);
        }
        #endregion

    }
}