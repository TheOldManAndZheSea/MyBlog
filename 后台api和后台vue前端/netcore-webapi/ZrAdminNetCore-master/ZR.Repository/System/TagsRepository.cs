using Infrastructure.Attribute;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZR.Model.System.Blog;

namespace ZR.Repository.System
{
    /// <summary>
    /// 标签管理
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class TagsRepository : BaseRepository<T_Tag>
    {

    }

    /// <summary>
    /// 文章标签关联表管理
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class ArticleTagsRepository : BaseRepository<ArticleTags>
    {
        /// <summary>
        /// 根据文章ID获取标签数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<ArticleTags> GetArticleTagsForArticleId(int id)
        {
            var result = Context.Queryable<ArticleTags>().LeftJoin<T_Tag>((a, t) => a.tag_id == t.Id).
                Where(a => a.article_id == id).
                Select((a, t) => new ArticleTags { article_id = a.article_id, tag_id = a.tag_id, TagName = t.Name }).ToList();
            return result;
        }
    }
}
