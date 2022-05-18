using Infrastructure;
using Infrastructure.Attribute;
using Infrastructure.Enums;
using Infrastructure.Model;
using Mapster;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZR.Admin.WebApi.Extensions;
using ZR.Admin.WebApi.Filters;
using ZR.Model.System.Blog;
using ZR.Model.System.Dto;
using ZR.Service.System.IService;

namespace ZR.Admin.WebApi.Controllers.System
{
    /// <summary>
    /// 标签管理
    /// </summary>
    [Verify]
    [Route("tag")]
    public class TagController : BaseController
    {
        private readonly ITagService _tagService;
        private readonly IArticleTagsService _articleTagsService;
        private readonly IArticleService _articleService;
        private readonly IArticleCategoryService _ArticleCategoryService;
        private readonly ISysUserService UserService;

        public TagController(ITagService tagService, IArticleTagsService articleTagsService, IArticleService articleService, IArticleCategoryService articleCategoryService,
            ISysUserService userService)
        {
            _tagService = tagService;
            _articleService = articleService;
            _articleTagsService = articleTagsService;
            UserService = userService;
            _ArticleCategoryService = articleCategoryService;
        }

        /// <summary>
        /// 查询所有标签
        /// </summary>
        /// <returns></returns>
        [HttpGet("getList")]
        [AllowAnonymousAttribute]
        public IActionResult Query()
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<T_Tag>();

            var response = _tagService.Queryable()
                .Where(predicate.ToExpression()).ToList();
            if (response != null && response.Count != 0)
            {
                foreach (var item in response)
                {
                    //查询标签下的文章数量
                    item.ArticlesCount = _articleTagsService.Count(s => s.tag_id == item.Id);
                }
            }

            return SUCCESS(response);
        }

        /// <summary>
        /// 查询十条
        /// </summary>
        /// <returns></returns>
        [HttpGet("getPart")]
        [AllowAnonymousAttribute]
        public IActionResult GetPartQuery()
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<T_Tag>();

            var response = _tagService.Queryable()
                .Where(predicate.ToExpression()).Take(10).ToList();
            if (response != null && response.Count != 0)
            {
                foreach (var item in response)
                {
                    //查询标签下的文章数量
                    item.ArticlesCount = _articleTagsService.Count(s => s.tag_id == item.Id);
                }
            }

            return SUCCESS(response);
        }

        /// <summary>
        /// 根据文章ID查询标签
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("{id}")]
        [AllowAnonymousAttribute]
        public IActionResult GetTagsForArticleId(int id)
        {
            var tagids = _articleTagsService.GetList(s => s.article_id == id);
            var response = _tagService.Queryable().ToList().Where(a => tagids.Exists(s => s.tag_id == a.Id)).ToList();
            return SUCCESS(response);
        }

        /// <summary>
        /// 根据文章ID查询标签
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("getBlogs/{id}")]
        [AllowAnonymousAttribute]
        public IActionResult GetArticlesForTagId(int id)
        {
            var blogids = _articleTagsService.GetList(s => s.tag_id == id);
            var response = _articleService.Queryable().ToList().Where(a => blogids.Exists(s => s.article_id == a.Cid)).ToList();
            if (response != null)
            {
                foreach (var item in response)
                {
                    item.Category = _ArticleCategoryService.GetFirst(s => s.Category_Id == item.Category_id);
                    item.Author = UserService.GetFirst(s => s.UserId == item.UserId);
                    item.Tags = _articleTagsService.GetArticleTagsForArticleId(item.Cid);
                }
            }
            return SUCCESS(response);
        }

        /// <summary>
        /// 添加标签
        /// </summary>
        /// <returns></returns>
        [HttpPost("add")]
        [ActionPermissionFilter(Permission = "blog:tag:add")]
        [Log(Title = "标签添加", BusinessType = BusinessType.INSERT)]
        public IActionResult Create([FromBody] T_Tag parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var addModel = parm.Adapt<T_Tag>().ToCreate(context: HttpContext);
            return SUCCESS(_tagService.Add(addModel));
        }

        /// <summary>
        /// 更新标签
        /// </summary>
        /// <returns></returns>
        [HttpPut("edit")]
        [ActionPermissionFilter(Permission = "blog:tag:update")]
        [Log(Title = "标签修改", BusinessType = BusinessType.UPDATE)]
        public IActionResult Update([FromBody] T_Tag parm)
        {
            //从 Dto 映射到 实体
            var addModel = parm.Adapt<T_Tag>().ToCreate(context: HttpContext);
            var response = _tagService.Update(it => it.Id == addModel.Id,
                f => new T_Tag
                {
                    ArticlesCount = addModel.ArticlesCount,
                    Name = addModel.Name
                }).ToCreate();

            return SUCCESS(response);
        }

        /// <summary>
        /// 删除标签
        /// </summary>
        /// <returns></returns>
        [HttpDelete("{id}")]
        [ActionPermissionFilter(Permission = "blog:tag:delete")]
        [Log(Title = "标签删除", BusinessType = BusinessType.DELETE)]
        public IActionResult Delete(int id = 0)
        {
            if (id <= 0)
            {
                return ToResponse(ApiResult.Error($"删除失败Id 不能为空"));
            }
            //判断此标签下是否有文章
            var countmodel = _articleTagsService.Count(s=>s.tag_id==id);
            if (countmodel>0)
            {
                return ToResponse(ApiResult.Error($"删除失败,此标签下有文章不能删除"));
            }
            // 删除文章
            var response = _tagService.Delete(id);

            return SUCCESS(response);
        }

        #region 标签文章链接表操作
        /// <summary>
        /// 添加标签文章关联表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpPost("addCon")]
        [ActionPermissionFilter(Permission = "blog:tag:addCon")]
        [Log(Title = "标签、文章关联表添加", BusinessType = BusinessType.INSERT)]
        public IActionResult CreateCon([FromBody] TagDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            var addModel = new List<ArticleTags>();
            if (parm.TagIds!=null)
            {
                foreach (var item in parm.TagIds)
                {
                    addModel.Add(new ArticleTags {  article_id = parm.article_id, tag_id =item});
                }
            }
            return SUCCESS(_articleTagsService.Insert(addModel));
        }

        [HttpPut("editCon")]
        [ActionPermissionFilter(Permission = "blog:tag:editCon")]
        [Log(Title = "标签、文章关联表修改或删除", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateCon([FromBody] TagDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //先删除再添加
            var addModel = new List<ArticleTags>();
            if (_articleTagsService.Delete(s => s.article_id == parm.article_id)>0)
            {
                if (parm.TagIds != null)
                {
                    foreach (var item in parm.TagIds)
                    {
                        addModel.Add(new ArticleTags { article_id = parm.article_id, tag_id = item });
                    }
                }
            }
            return SUCCESS(_articleTagsService.Insert(addModel));
        }
        #endregion
    }
}
