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
using ZR.Model.Blog;
using ZR.Service.System.IService;
using Microsoft.AspNetCore.Authorization;

namespace ZR.Admin.WebApi.Controllers
{
    /// <summary>
    /// 文章类型Controller
    ///
    /// @author ztc
    /// @date 2022-03-30
    /// </summary>
    [Verify]
    [Route("Blog/Articlecategory")]
    public class ArticlecategoryController : BaseController
    {
        /// <summary>
        /// 文章类型接口
        /// </summary>
        private readonly IArticlecategoryService _ArticlecategoryService;
        /// <summary>
        /// 文章接口
        /// </summary>
        private readonly IArticleService _ArticleService;

        public ArticlecategoryController(IArticlecategoryService ArticlecategoryService,IArticleService articleService)
        {
            _ArticlecategoryService = ArticlecategoryService;
            _ArticleService = articleService;
        }

        /// <summary>
        /// 查询文章类型列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("list")]
        [ActionPermissionFilter(Permission = "blog:articlecategory:list")]
        public IActionResult QueryArticlecategory([FromQuery] ArticlecategoryQueryDto parm)
        {
            var response = _ArticlecategoryService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询文章类型详情
        /// </summary>
        /// <param name="CategoryId"></param>
        /// <returns></returns>
        [HttpGet("{CategoryId}")]
        [ActionPermissionFilter(Permission = "blog:articlecategory:query")]
        public IActionResult GetArticlecategory(int CategoryId)
        {
            var response = _ArticlecategoryService.GetFirst(x => x.Category_Id == CategoryId);
            
            return SUCCESS(response);
        }

        /// <summary>
        /// 添加文章类型
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionPermissionFilter(Permission = "blog:articlecategory:add")]
        [Log(Title = "文章类型", BusinessType = BusinessType.INSERT)]
        public IActionResult AddArticlecategory([FromBody] ArticleCategory parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<ArticleCategory>().ToCreate(HttpContext);

            var response = _ArticlecategoryService.Insert(modal, it => new
            {
                it.Name,
                it.ParentId,
                it.pic_url,
                it.color,
            });
            return ToResponse(response);
        }

        /// <summary>
        /// 更新文章类型
        /// </summary>
        /// <returns></returns>
        [HttpPut]
        [ActionPermissionFilter(Permission = "blog:articlecategory:edit")]
        [Log(Title = "文章类型", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateArticlecategory([FromBody] ArticleCategory parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<ArticleCategory>().ToUpdate(HttpContext);

            var response = _ArticlecategoryService.Update(w => w.Category_Id == modal.Category_Id, it => new ArticleCategory()
            {
                //Update 字段映射
                Name = modal.Name,
                ParentId = modal.ParentId,
                pic_url = modal.pic_url,
                color = modal.color,
            });

            return ToResponse(response);
        }

        /// <summary>
        /// 删除文章类型
        /// </summary>
        /// <returns></returns>
        [HttpDelete("{ids}")]
        [ActionPermissionFilter(Permission = "blog:articlecategory:delete")]
        [Log(Title = "文章类型", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteArticlecategory(string ids)
        {
            int[] idsArr = Tools.SpitIntArrary(ids);
            if (idsArr.Length <= 0) { return ToResponse(ApiResult.Error($"删除失败Id 不能为空")); }
            if (_ArticleService.Count(s=>ids.Contains(s.Category_id.ToString()))>0)
            {
                return ToResponse(ApiResult.Error($"删除失败，文章类型下有文章存在"));
            }
            var response = _ArticlecategoryService.Delete(idsArr);

            return ToResponse(response);
        }


    }
}