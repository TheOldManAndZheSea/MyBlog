<template>
  <div class="animate__animated animate__fadeInUp footer-wrap">
    <!--    center aligned居中-->
    <el-row :gutter="20" class="footer-info">
      <el-col class="ewm" :xs="24" :sm="4">
        <el-image
          :src="blogConfig.bottomImage"
          alt="图片加载失败"
          class="ui rounded image"
          style="width: 110px"
        />
      </el-col>
      <el-col class="new-blog" :xs="24" :sm="7">
        <h4 class="ui inverted header m-text-spaced">推荐链接</h4>
        <div id="newblog-container">
          <div
            class="recommend-blog l-text list"
            v-for="blog in footerList"
            :key="blog.id"
          >
            <a class="item" :href="blog.links" target="_blank">{{ blog.name }}</a>
          </div>
        </div>
      </el-col>
      <el-col class="connect" :xs="24" :sm="5">
        <h4 class="ui inverted header m-text-spaced">联系我</h4>
        <div class="ui inverted link list">
          <p class="item" v-if="blogConfig.authorEmail">Email：{{blogConfig.authorEmail}}</p>
          <p class="item" v-if="blogConfig.authorQQ">QQ：{{blogConfig.authorQQ}}</p>
        </div>
      </el-col>
      <el-col class="intro" :xs="24" :sm="8">
        <div class="seven wide column">
          <h4 class="ui inverted header m-text-spaced">博客简介</h4>
          <p class="m-text-thin m-text-spaced m-opacity-mini">
            {{blogConfig.content}}
          </p>
        </div>
      </el-col>
    </el-row>
    <el-row>
      <div class="author">
        <div v-html="blogConfig.copyright" class="m-text-thin m-text-spaced m-opacity-mini">
<!--           
          {{blogConfig.copyright}} -->
        </div>
      </div>
    </el-row>
  </div>
</template>

<script>
export default {
  data() {
    return {
      footerList: [],
      blogConfig: {},
    };
  },
  created() {
    this.getfooterList();
    this.getBlogCongif();
  },
  methods: {
    async getfooterList() {
      const { data: res } = await this.$blog.get("/Blog/TBlogconfig/getLinks");
      this.footerList = res.data;
    },
    //获取博客配置信息
    getBlogCongif() {
      this.$blog.get("/Blog/TBlogconfig/getQuery").then((res) => {
        if (res.data.code === 200) {
          this.blogConfig = res.data.data;
        }
      });
    },
  },
};
</script>

<style scoped lang="less">
*:hover {
  cursor: pointer;
}
.footer-wrap {
  bottom: 0 !important;
  line-height: 2;
  position: relative;
  padding: 40px 20px;
  color: #eee;
  font-size: 14px;
  text-align: center;
  background-color: #545c64;
  transition: 0.2s;
}
.footer-info {
  line-height: 15px;
  color: rgba(255, 255, 255, 0.5);
  a {
    text-decoration: none;
    color: rgba(255, 255, 255, 0.5);
  }
  h4 {
    color: white;
  }

  .list .item {
    line-height: 20px;
  }

  .list .item:hover {
    color: white;
  }
  .el-image {
    margin: 0 auto;
    opacity: 0.8;
  }
  .el-image:hover {
    opacity: 1;
  }
}
.author {
    margin-top: 35px;
  color: rgba(255, 255, 255, 0.5);
}

@media only screen and (max-width: 480px) {
  .ewm,
  .new-blog,
  .intro,
  .connect {
    display: none;
  }
}
</style>
