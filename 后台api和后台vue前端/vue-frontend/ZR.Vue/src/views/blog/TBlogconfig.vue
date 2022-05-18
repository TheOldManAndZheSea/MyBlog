<template>
  <div class="app-container">
    <el-form
      ref="form"
      :model="form"
      :rules="rules"
      :label-width="formLabelWidth"
    >
      <el-row :gutter="20">
        <el-col :lg="12">
          <el-form-item label="博客标题" prop="title">
            <el-input v-model="form.title" placeholder="请输入博客标题" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="作者qq" prop="authorQQ">
            <el-input v-model="form.authorQQ" placeholder="请输入作者qq" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="作者微信" prop="authorWechart">
            <el-input
              v-model="form.authorWechart"
              placeholder="请输入作者微信"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="作者邮箱" prop="authorEmail">
            <el-input v-model="form.authorEmail" placeholder="请输入作者邮箱" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="是否开放登录" prop="isOpenLogin">
            <el-radio-group v-model="form.isOpenLogin">
              <el-radio
                v-for="item in isOpenLoginOptions"
                :key="item.dictValue"
                :label="item.dictValue"
                >{{ item.dictLabel }}</el-radio
              >
            </el-radio-group>
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="是否开放注册" prop="isOpenRegister">
            <el-radio-group v-model="form.isOpenRegister">
              <el-radio
                v-for="item in isOpenRegisterOptions"
                :key="item.dictValue"
                :label="item.dictValue"
                >{{ item.dictLabel }}</el-radio
              >
            </el-radio-group>
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="博客简介" prop="content">
            <el-input
              type="textarea"
              v-model="form.content"
              placeholder="请输入博客简介"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="博客背景图" prop="blogBackGroundImage">
            <!-- <UploadImage
              v-model="form.blogBackGroundImage"
              :fileName="blogBackGroundImage"
              column="blogBackGroundImage"
              @input="handleUploadSuccess"
            /> -->
            <el-input v-model="form.blogBackGroundImage" placeholder="请输入博客背景图链接" />
          </el-form-item>
        </el-col>
        <el-col :lg="24">
          <el-form-item label="友情链接" prop="links">
            <el-tag
              :key="id"
              v-for="(link, id) in linksList"
              closable
              :disable-transitions="false"
              @click="handlelinkUpdate(link)"
              @close="handlelinkDelete(link)"
            >
              <a :href="link.links" target="_blank">{{ link.name }}</a>
            </el-tag>
            <el-button
              icon="el-icon-plus"
              class="button-new-tag"
              size="mini"
              round
              type="primary"
              @click="handlelinkAdd"
              >添加</el-button
            >
          </el-form-item>
        </el-col>
        <el-col :lg="8">
          <el-form-item label="最下方图片链接" prop="bottomImage">
            <UploadImage
              v-model="form.bottomImage"
              column="bottomImage"
              @input="handleUploadSuccess"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="8">
          <el-form-item label="支付宝赞助图片" prop="fundedAlipayImg">
            <UploadImage
              v-model="form.fundedAlipayImg"
              column="fundedAlipayImg"
              @input="handleUploadSuccess"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="8">
          <el-form-item label="微信赞助图片" prop="fundedWechartImg">
            <UploadImage
              v-model="form.fundedWechartImg"
              column="fundedWechartImg"
              @input="handleUploadSuccess"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="24">
          <el-form-item label="版权所有" prop="copyright">
            <codemirror class="codeedit" ref="cm"
      v-model="form.copyright"
      :options="cmOptions"/>
            <!-- <el-input v-model="form.copyright" placeholder="请输入版权所有" /> -->
          </el-form-item>
        </el-col>
        <el-col :lg="24">
          <el-form-item>
           <el-button type="primary" @click="submitForm">确 定</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <!-- 添加或修改博客友情链接对话框 -->
    <el-dialog
      :title="linkstitle"
      :lock-scroll="false"
      :visible.sync="linksopen"
    >
      <el-form
        ref="linksform"
        :model="linksform"
        :label-width="formLabelWidth"
      >
        <el-row :gutter="20">
    <el-col :lg="12">
      <el-form-item label="名称" prop="name">
        <el-input v-model="linksform.name" placeholder="请输入名称" />
      </el-form-item>
    </el-col>
    <el-col :lg="12">
      <el-form-item label="跳转链接" prop="links">
        <el-input v-model="linksform.links" placeholder="请输入跳转链接" />
      </el-form-item>
    </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="text" @click="cancel">取 消</el-button>
        <el-button type="primary" @click="linksubmitForm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import { getTBlogconfig,updateTBlogconfig } from "@/api/blog/tBlogconfig.js";
import { 
  getTBloglinks,
  listTBloglinks,
  addTBloglinks,
  delTBloglinks,
  updateTBloglinks,
} from '@/api/blog/tBloglinks.js';
// 全局引入vue-codemirror
  import {codemirror} from 'vue-codemirror';
  // 引入css文件
  import 'codemirror/lib/codemirror.css'
  // 引入主题 可以从 codemirror/theme/ 下引入多个
  import 'codemirror/theme/idea.css'
  import 'codemirror/mode/xml/xml.js'
export default {
  name: "tblogconfig",
  components: {  //解决vue中组件的循环引用 
		codemirror
  },
  data() {
    return {
      cmOptions: {
          // 主题
          theme: 'idea',
          // 显示函数
          line: true,
          lineNumbers: true,
          // 软换行
          lineWrapping: true,
          // tab宽度
          tabSize: 4,
      },
      labelWidth: "100px",
      formLabelWidth: "100px",
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 表单参数
      form: {},
      // 是否开放登录选项列表 格式 eg:{ dictLabel: '标签', dictValue: '0'}
      isOpenLoginOptions: [],
      // 是否开放注册选项列表 格式 eg:{ dictLabel: '标签', dictValue: '0'}
      isOpenRegisterOptions: [],
      // 提交按钮是否显示
      btnSubmitVisible: true,
      // 表单校验
      rules: {
        title: [
          { required: true, message: "博客标题不能为空", trigger: "blur" },
        ],
        copyright: [
          { required: true, message: "版权所有不能为空", trigger: "blur" },
        ],
        authorEmail: [
          { required: true, message: "作者邮箱不能为空", trigger: "blur" },
        ],
        blogBackGroundImage: [
          { required: true, message: "博客背景图不能为空", trigger: "blur" },
        ],
      },
      //友情链接
      linksList:[],
      //友情链接表单
      linksform:{},
      // 弹出层标题
      linkstitle: "",
      // 操作类型 1、add 2、edit
      linksopertype: 0,
      // 是否显示弹出层
      linksopen: false,
    };
  },
  created() {
    // 列表数据查询
    this.handleQuery();
    this.getlinksList();
    var dictParams = [
      { dictType: "sys_normal_disable", columnName: "isOpenLoginOptions" },
      { dictType: "sys_normal_disable", columnName: "isOpenRegisterOptions" },
    ];
    this.getDicts(dictParams).then((response) => {
      response.data.forEach((element) => {
        this[element.columnName] = element.list;
      });
    });
  },
  methods: {
    //查询操作
    handleQuery() {
      getTBlogconfig().then((res) => {
        this.form = res.data
      });
    },
    //图片上传成功方法
    handleUploadSuccess(column, filelist) {
      this.form[column] = filelist;
    },
    // 是否开放登录字典翻译
    isOpenLoginFormat(row, column) {
      return this.selectDictLabel(this.isOpenLoginOptions, row.isOpenLogin);
    },
    // 是否开放注册字典翻译
    isOpenRegisterFormat(row, column) {
      return this.selectDictLabel(
        this.isOpenRegisterOptions,
        row.isOpenRegister
      );
    },
    //获取友情链接列表
    getlinksList() {
      listTBloglinks().then((res) => {
        if (res.code === 200) {
          this.linksList = res.data;
        }
      });
    },
    // 重置数据表单
    linksreset() {
      this.linksform = {
        name: undefined,
        links: undefined,
      };
      this.resetForm("linksform");
    },
    /** 新增按钮操作 */
    handlelinkAdd() {
      this.linksreset();
      this.linksopen = true;
      this.linkstitle = "添加";
      this.linksopertype = 1;
    },
    /** 删除按钮操作 */
    handlelinkDelete(row) {
      const Ids = row.id;

      this.$confirm('是否确认删除参数编号为"' + Ids + '"的数据项？')
        .then(function () {
          return delTBloglinks(Ids);
        })
        .then(() => {
          this.getlinksList();
          this.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 修改按钮操作 */
    handlelinkUpdate(row) {
      this.linksreset();
      const id = row.id;
      getTBloglinks(id).then((res) => {
        const { code, data } = res;
        if (code == 200) {
          this.linksopen = true;
          this.linkstitle = "修改数据";
          this.linksopertype = 2;

          this.linksform = {
            ...data,
          };
        }
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          //console.log(JSON.stringify(this.form));
          updateTBlogconfig(this.form)
            .then((res) => {
              this.msgSuccess("修改成功");
              this.handleQuery();
            })
            .catch((err) => {
              //TODO 错误逻辑
            });
        }
      });
    },
    linksubmitForm: function () {
      this.$refs["linksform"].validate((valid) => {
        if (valid) {
          if (this.linksform.id != undefined && this.linksopertype === 2) {
            updateTBloglinks(this.linksform)
              .then((res) => {
                this.msgSuccess("修改成功");
                this.linksopen = false;
                this.getlinksList();
              })
              .catch((err) => {
                //TODO 错误逻辑
              });
          } else {
            addTBloglinks(this.linksform)
              .then((res) => {
                this.msgSuccess("新增成功");
                this.linksopen = false;
                this.getlinksList();
              })
              .catch((err) => {
                //TODO 错误逻辑
              });
          }
        }
      });
    },
    // 取消按钮
    cancel() {
      this.linksopen = false;
      this.linksreset();
    },
  },
};
</script>
<style>
.button-new-tag {
  margin-left: 10px;
  padding-top: 0;
  padding-bottom: 0;
}
.codeedit{
  border: 1px solid #eee;
  height: auto;
}
</style>