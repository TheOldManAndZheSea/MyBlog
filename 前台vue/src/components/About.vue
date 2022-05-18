<template>
  <div class="box">
    <aside class="animate__animated animate__bounceInLeft sidebar">
      <div class="avatar">
        <img :src="blogInfo.avatar" :title="blogInfo.name" />
      </div>
      <nav class="nav">
        <a
          v-for="intro in introduceList"
          @click="showSection(intro.name)"
          :key="intro.id"
          ><i :class="intro.icon" style="margin-right: 10px"></i>
          {{ intro.title }}</a
        >
      </nav>
    </aside>
    <main>
      <section
        class="animate__animated animate__fadeInRight"
        v-if="showSectionId === '#info'"
        id="info"
      >
        <div class="wrap">
          <h2 class="title">
            <i class="iconfont icon-gerenzhongxin1"></i> 个人资料
          </h2>
          <el-row :gutter="20" class="row">
            <el-col :sm="8" :xs="24" class="col-l-4">
              <p>
                <i class="iconfont icon-name" style="margin-right: 5px"></i
                >姓名：{{ blogInfo.name }}
              </p>
              <p v-if="blogInfo.sex === '0'">
                <i class="iconfont icon-sex" style="margin-right: 5px"></i
                >性别：男
              </p>
              <p v-else>
                <i class="iconfont icon-sex" style="margin-right: 5px"></i
                >性别：女
              </p>
              <p>
                <i class="iconfont icon-nianling" style="margin-right: 5px"></i
                >年龄：{{ blogInfo.age }}
              </p>
              <p>
                <i class="iconfont icon-xueli" style="margin-right: 5px"></i
                >学历：{{ blogInfo.degree }}
              </p>
              <!-- <p>
                <i class="iconfont icon-qq1" style="margin-right: 5px"></i
                >QQ：2569757226
              </p> -->
              <p>
                <i class="iconfont icon-shengao" style="margin-right: 5px"></i
                >身高：{{ blogInfo.height }}cm
              </p>
              <p>
                <i class="iconfont icon-icon1" style="margin-right: 5px"></i
                >体重：{{ blogInfo.weight }}kg
              </p>
              <p>
                <i class="iconfont icon-shouye" style="margin-right: 5px"></i
                >血型：{{ blogInfo.blood }}型
              </p>
            </el-col>
            <el-col :sm="16" :xs="24" class="col-l-4">
              <p>
                <i
                  class="iconfont icon-chushengriqi"
                  style="margin-right: 5px"
                ></i
                >出生日期：{{ blogInfo.birthday }}
              </p>
              <p>
                <i class="iconfont icon-xuexiao1" style="margin-right: 5px"></i
                >学校：{{ blogInfo.school }}
              </p>
              <p>
                <i class="iconfont icon-zhuanye1" style="margin-right: 5px"></i
                >专业：{{ blogInfo.specialized }}
              </p>
              <p v-if="blogInfo.giteeUrl">
                <i
                  class="iconfont icon-gitee-fill-round"
                  style="margin-right: 5px"
                ></i
                >码云仓库：<a :href="blogInfo.giteeUrl">{{
                  blogInfo.giteeUrl
                }}</a>
              </p>
              <p v-if="blogInfo.csdnUrl">
                <i class="iconfont icon-csdn1" style="margin-right: 5px"></i
                >CSDN博客：<a :href="blogInfo.csdnUrl">{{
                  blogInfo.csdnUrl
                }}</a>
              </p>
              <p>
                <i class="iconfont icon-email" style="margin-right: 5px"></i
                >邮箱：<a :href="'mailto:' + blogInfo.email">{{
                  blogInfo.email
                }}</a>
              </p>
            </el-col>
          </el-row>
        </div>
      </section>
      <section
        class="animate__animated animate__fadeInRight"
        v-show="showSectionId === '#skills'"
        id="skills"
      >
        <div class="wrap">
          <h2 class="title">
            <i class="iconfont icon-zhuanye"></i> 掌握的技能
          </h2>
          <el-row :gutter="40" class="row scrollable">
            <el-col
              :sm="8"
              :xs="24"
              v-for="sikll in skillList"
              :key="sikll.id"
              class="center-fixed"
            >
              <div class="skills-icon">
                <i :class="sikll.picIcon"></i>
              </div>
              <div class="skills-title">
                <h3>{{ sikll.name }}</h3>
                <p>{{ sikll.des }}</p>
              </div>
            </el-col>
            <!-- <el-col :sm="8" :xs="24" class="center-fixed">
              <div class="skills-icon">
                <i class="iconfont icon-html"></i>
              </div>
              <div class="skills-title">
                <h3>HTML5</h3>
                <p>熟悉 HTML5 网站的架构和开发</p>
              </div>
            </el-col>
            <el-col :sm="8" :xs="24" class="center-fixed">
              <div class="skills-icon">
                <i class="iconfont icon-css1"></i>
              </div>
              <div class="skills-title">
                <h3>CSS3</h3>
                <p>熟悉使用 CSS3 写响应式网站、动画等</p>
              </div>
            </el-col>
            <el-col :sm="8" :xs="24" class="center-fixed">
              <div class="skills-icon">
                <i class="iconfont icon-logo-javascript"></i>
              </div>
              <div class="skills-title">
                <h3>JavaScript</h3>
                <p>能使用 JS 制作简单的程序、交互与后端数据的获取</p>
              </div>
            </el-col>
            <el-col :sm="8" :xs="24" class="center-fixed">
              <div class="skills-icon">
                <i class="iconfont icon-Vue"></i>
              </div>
              <div class="skills-title">
                <h3>Vue</h3>
                <p>熟悉Vue的开发流程，能够使用Vue框架开发完整项目</p>
              </div>
            </el-col>
            <el-col :sm="8" :xs="24" class="center-fixed">
              <div class="skills-icon">
                <i class="iconfont icon-java"></i>
              </div>
              <div class="skills-title">
                <h3>Java</h3>
                <p>熟悉Java语言的基本使用，能使用SpringBoot进行后端开发</p>
              </div>
            </el-col>
            <el-col :sm="8" :xs="24" class="center-fixed">
              <div class="skills-icon">
                <i class="iconfont icon-shujujiegou-01"></i>
              </div>
              <div class="skills-title">
                <h3>计算机专业基础</h3>
                <p>熟悉基本的数据结构，算法，计算机网络等相关知识</p>
              </div>
            </el-col> -->
          </el-row>
        </div>
      </section>
      <section
        class="animate__animated animate__fadeInRight"
        v-show="showSectionId === '#works'"
        id="works"
      >
        <div class="wrap">
          <h2 class="title"><i class="iconfont icon-zuopin1"></i>个人作品</h2>
          <el-row :gutter="30">
            <el-col
              :xs="24"
              :sm="12"
              :lg="8"
              v-for="work in workList"
              :key="work.id"
            >
              <div class="works-item">
                <el-card class="works-item-front">
                  <el-image :src="work.picUrl" />
                  <p>{{ work.title }}</p>
                </el-card>
                <el-card class="works-item-back">
                  <p>{{ work.content }}</p>
                </el-card>
              </div>
            </el-col>
          </el-row>
        </div>
      </section>
      <section
        class="animate__animated animate__fadeInRight"
        v-show="showSectionId === '#hobbys'"
        id="hobbys"
      >
        <h2 class="title"><i class="iconfont icon-xingquaihao"></i>我的爱好</h2>
        <div class="row">
          <el-carousel
            :interval="2000"
            :type="cardOpen ? 'card' : ''"
            height="350px"
          >
            <el-carousel-item v-for="hobby in hobbyList" :key="hobby.id">
              <el-card class="hobby">
                <el-image style="width: 100%" :src="hobby.picUrl"></el-image>
                <h3 class="tit">{{ hobby.title }}</h3>
                <p>{{ hobby.content }}</p>
              </el-card>
            </el-carousel-item>
          </el-carousel>
        </div>
      </section>
      <section
        class="animate__animated animate__fadeInRight"
        v-show="showSectionId === '#summary'"
        id="summary"
      >
        <div class="wrap">
          <h2 class="title">
            <i class="iconfont icon-ziwopingjia"></i>自我评价
          </h2>
          <div class="row">
            <ul>
              <li>一个对一切未知的事物都会抱有好奇心的人</li>
              <li>一个希望用自己所有的精力将事情做到最尽可能完美的人</li>
              <li>
                一个喜欢拥抱不确定性，爱折腾，去见不同的人，感受不同的环境，不喜欢一成不变的人
              </li>
            </ul>
          </div>
        </div>
      </section>
    </main>
  </div>
</template>

<script>
export default {
  data() {
    return {
      screenWidth: document.documentElement.clientWidth, //实时屏幕宽度,
      showSectionId: "#info",
      blogInfo: {},
      introduceList: [
        {
          id: 0,
          title: "资料",
          name: "#info",
          icon: "iconfont icon-zhuanye1",
        },
        {
          id: 1,
          title: "技能",
          name: "#skills",
          icon: "iconfont icon-jinengliang-xian",
        },
        {
          id: 2,
          title: "作品",
          name: "#works",
          icon: "iconfont icon-zuopin",
        },
        {
          id: 3,
          title: "爱好",
          name: "#hobbys",
          icon: "iconfont icon-xingquaihao",
        },
        {
          id: 4,
          title: "评价",
          name: "#summary",
          icon: "iconfont icon-ziwopingjia",
        },
      ],
      workList: [],
      hobbyList: [],
      skillList: [],
    };
  },
  computed: {
    cardOpen() {
      return this.screenWidth >= 748;
    },
  },
  created() {
    window.addEventListener("resize", this.screenAdapter);
    this.getPersonInfo();
    this.getWorkList();
    this.gethobbyList();
    this.getskillList();
  },
  methods: {
    showSection(name) {
      this.showSectionId = name;
    },
    //查询个人作品
    async getWorkList() {
      const { data: res } = await this.$blog.get("/Blog/TBlogproject/list", {
        params: { TypeName: "4" },
      });
      if (res.code === 200) {
        this.workList = res.data.result;
      }
    },
    //查询爱好
    async gethobbyList() {
      const { data: res } = await this.$blog.get("/Blog/TBlogproject/list", {
        params: { TypeName: "1" },
      });
      if (res.code === 200) {
        this.hobbyList = res.data.result;
      }
    },
    //查询技能
    async getskillList() {
      const { data: res } = await this.$blog.get(
        "/Blog/TBlogpersonalinfo/skill/list"
      );
      if (res.code === 200) {
        this.skillList = res.data.result;
      }
    },
    getPersonInfo() {
      this.$blog.get("/Blog/TBlogpersonalinfo/1").then((res) => {
        debugger;
        if (res.data.code === 200) {
          this.blogInfo = res.data.data;
        }
      });
    },
    // 屏幕尺寸变化的监听函数
    screenAdapter() {
      this.screenWidth = document.documentElement.clientWidth;
    },
  },
};
</script>

<style scoped lang="less">
body {
  height: 100vh;
  overflow: hidden;
}

.box {
  width: 100%;
  height: 100vh;
  position: relative;
}

.sidebar {
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  color: #fff;
  width: 250px;
  height: 100%;
  overflow: hidden;
  overflow-y: auto;
  background: rgba(75, 75, 75, 0.9);

  nav {
    margin: 0;
    display: flex;
    list-style: none;
    flex-direction: column;

    a {
      font: 16px/1.5 "Microsoft Yahei", "PingFang SC", "Hiragino Sans GB",
        sans-serif;
      list-style: none;
      box-sizing: border-box;
      text-decoration: none;
      color: #fff;
      padding: 1em;
      display: block;
      text-align: center;
      transition: background 0.3s, box-shadow 0.3s;
    }

    a:hover {
      background: rgba(60, 60, 60, 1);
    }
  }

  .avatar {
    width: 140px;
    height: 140px;
    margin: 1em auto;
    margin-top: 5em;
    background: #fff;
    border-radius: 100%;
    border: #fff 5px solid;
    transition: transform 0.5s;

    img {
      width: 100%;
      border-radius: 50%;
      /*transition: .6s;*/
    }

    img:hover {
      transform: rotate(360deg);
      transition: all 1.5s;
    }
  }
}

main {
  color: #353535;
  font: 16px/1.5 "Microsoft Yahei", "PingFang SC", "Hiragino Sans GB",
    sans-serif;
  box-sizing: border-box;
  margin-left: 250px;

  section {
    top: 50%;
    transform: translateY(-50%);
    position: relative;
    background-color: rgba(255, 255, 255, 0.8);
    border: 3px dashed rgba(0, 0, 0, 0.3);
    border-radius: 20px;
    padding: 20px;
    .title {
      display: flex;
      justify-content: flex-start;
      align-items: center;
      i {
        font-size: larger;
        margin-right: 10px;
      }
    }
    a {
      text-decoration: none;
    }
  }

  section:before {
    content: "";
    position: absolute;
    width: 0;
    height: 0;
    border-right: 20px solid rgba(0, 0, 0, 0.3);
    border-top: 20px solid transparent;
    border-bottom: 20px solid transparent;
    top: 50%;
    transform: translateY(-50%);
    left: -20px;
  }

  #info {
    .warp {
      .row {
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
    }
  }

  #skills {
    .center-fixed {
      text-align: center;
      display: flex;
      flex-direction: column;

      .skills-icon {
        width: 100px;
        height: 100px;
        margin: 0 auto;
        background: #fff;
        border-radius: 100%;
        box-shadow: 0 5px rgba(0, 0, 0, 0.3);

        i {
          font-size: 50px;
          line-height: 100px;
          transition: all 1s;
        }

        .fa-html5 {
          content: "\f13b";
        }
      }

      .skills-icon:hover {
        i {
          transform: rotate(180deg);
          transition: all 1s;
        }
      }
    }
  }
  #works {
    .el-card /deep/ .el-card__body {
      padding: 0;
    }

    .works-item {
      margin-bottom: 20px;
      position: relative;
      .works-item-front,
      .works-item-back {
        background-color: white;
        text-align: center;
        border-radius: 5px;
        box-shadow: 0 0 5px 0 #ccc;
        border: 1px solid #5d5d5d;
        transition: all 1s;
        backface-visibility: hidden;
        width: 100%;
        height: 100%;
      }
      .works-item-front {
        .el-image {
          max-width: 100%;
          max-height: 180px;
          border-radius: 5px 5px 0 0;
        }
        p {
          margin-top: 2px;
          margin-bottom: 2px;
          color: #303133;
        }
      }
      .works-item-back {
        box-sizing: border-box;
        padding: 20px;
        position: absolute;
        top: 0;
        background: rgba(255, 255, 255, 0.8);
        transform: rotateY(180deg);
      }
    }
    .works-item:hover {
      .works-item-back {
        transform: rotateY(0deg);
      }
      .works-item-front {
        transform: rotateY(180deg);
      }
    }
  }

  #hobbys {
    .el-card /deep/ .el-card__body {
      padding: 0;
      height: 350px;
    }
    .hobby {
      opacity: 0.9;
      background-color: rgba(255, 255, 255, 0.9);
      box-shadow: none;
      margin-bottom: 20px;
      border-radius: 20px;
      .el-image {
        width: 100%;
        max-height: 200px;
      }
      .tit {
        margin: 0 auto;
        line-height: 20px;
        text-align: center;
      }
      p {
        margin: 0;
        padding: 20px;
        font-size: medium;
      }
    }
  }
  #summary {
    ul {
      li {
        line-height: 50px;
        border-bottom: 2px dashed #63a35c;
        background-color: rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
        border-radius: 9999px;
        list-style-type: circle;
      }
    }
  }
}

@media screen and (max-width: 768px) {
  .sidebar {
    position: relative;
    top: 0;
    width: 100%;
    height: auto;
    display: flex;
    flex-direction: column;
    .avatar {
      margin: 1rem auto;
      width: 100px;
      height: 100px;
    }
    nav {
      background-color: rgba(255, 255, 255, 0.1);
      display: flex;
      flex-direction: row;
      justify-content: space-around;
      align-items: center;
    }
  }
  main {
    margin: 0 auto;
    width: 100%;
    text-align: center;
    section {
      border-radius: 0;
      border: none;
    }
    #summary {
      ul {
        li {
          border-radius: 0;
          border-bottom: none;
          background-color: transparent;
          text-align: left;
        }
      }
    }
  }
}
</style>