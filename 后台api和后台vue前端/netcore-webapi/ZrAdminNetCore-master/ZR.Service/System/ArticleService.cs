using Infrastructure.Attribute;
using SqlSugar;
using ZR.Model.System;
using ZR.Repository.System;
using ZR.Service.System.IService;

namespace ZR.Service.System
{
    /// <summary>
    /// 
    /// </summary>
    [AppService(ServiceType = typeof(IArticleService), ServiceLifetime = LifeTime.Transient)]
    public class ArticleService : BaseService<Article>, IArticleService
    {
        private ArticleRepository articleRepository;
        private ArticleTagsRepository tagsRepository;
        public ArticleService(ArticleRepository repository,ArticleTagsRepository articleTags) : base(repository)
        {
            articleRepository = repository;
            tagsRepository = articleTags;
        }

        public int Delete(int id)
        {
            //删除文章
            var result = articleRepository.Delete(id);
            //删除文章标签
            if (result>0)
            {
                result = tagsRepository.Delete(s=>s.article_id==id);
                return result;
            }
            return result;
        }
    }
}
