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
          <el-form-item label="姓名" prop="name">
            <el-input v-model="form.name" placeholder="请输入姓名" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="性别" prop="sex">
            <el-select v-model="form.sex" placeholder="请选择性别">
              <el-option
                v-for="item in sexOptions"
                :key="item.dictValue"
                :label="item.dictLabel"
                :value="item.dictValue"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="年龄" prop="age">
            <el-input-number
              v-model.number="form.age"
              controls-position="right"
              placeholder="请输入年龄"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="学历" prop="degree">
            <el-input v-model="form.degree" placeholder="请输入学历" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="身高cm" prop="height">
            <el-input-number
              v-model.number="form.height"
              controls-position="right"
              placeholder="请输入身高cm"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="体重kg" prop="weight">
            <el-input-number
              v-model.number="form.weight"
              controls-position="right"
              placeholder="请输入体重kg"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="出生日期" prop="birthday">
            <el-date-picker
              v-model="form.birthday"
              format="yyyy-MM-dd HH:mm:ss"
              value-format="yyyy-MM-dd HH:mm:ss"
              type="datetime"
              placeholder="选择日期时间"
            >
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="学校" prop="school">
            <el-input v-model="form.school" placeholder="请输入学校" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="专业" prop="specialized">
            <el-input v-model="form.specialized" placeholder="请输入专业" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="血型" prop="blood">
            <el-input v-model="form.blood" placeholder="请输入血型" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="码云地址" prop="giteeUrl">
            <el-input v-model="form.giteeUrl" placeholder="请输入码云地址" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="Github地址" prop="gitHubUrl">
            <el-input v-model="form.gitHubUrl" placeholder="请输入Github地址" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="CSDN博客地址" prop="cSDNUrl">
            <el-input v-model="form.cSDNUrl" placeholder="请输入CSDN博客地址" />
          </el-form-item>
        </el-col>
        <el-col :lg="12">
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="form.email" placeholder="请输入邮箱" />
          </el-form-item>
        </el-col>
        <el-col :lg="24">
          <el-form-item label="技能">
            <el-tag
              :key="id"
              v-for="(skill, id) in skillList"
              closable
              :disable-transitions="false"
              @click="handleSkillUpdate(skill)"
              @close="handleSkillDelete(skill)"
            >
              <i :class="skill.picIcon"></i>
              {{ skill.name }}
            </el-tag>
            <el-button
              icon="el-icon-plus"
              class="button-new-tag"
              size="mini"
              round
              type="primary"
              @click="handleSkillAdd"
              >添加</el-button
            >
          </el-form-item>
        </el-col>
        <el-col :lg="24">
          <el-form-item label="头像" prop="avatar">
            <UploadImage
              v-model="form.avatar"
              column="avatar"
              @input="handleUploadSuccess"
            />
          </el-form-item>
        </el-col>
        <el-col :lg="24">
          <el-form-item>
            <el-button type="primary" @click="submitForm">确 定</el-button>
          </el-form-item>
        </el-col>
      </el-row>
    </el-form>
    <!-- 添加或修改博客个人技能对话框 -->
    <el-dialog
      :title="skilltitle"
      :lock-scroll="false"
      :visible.sync="skillopen"
    >
      <el-form
        ref="skillform"
        :model="skillform"
        :rules="rules"
        :label-width="formLabelWidth"
      >
        <el-row :gutter="20">
          <el-col :lg="12">
            <el-form-item label="技能名称" prop="name">
              <el-input v-model="skillform.name" placeholder="请输入技能名称" />
            </el-form-item>
          </el-col>
          <el-col :lg="12">
            <el-form-item label="技能icon" prop="picIcon">
              <e-icon-picker v-model="skillform.picIcon"> </e-icon-picker>
            </el-form-item>
          </el-col>
          <el-col :lg="24">
            <el-form-item label="节能描述" prop="des">
              <el-input
                type="textarea"
                v-model="skillform.des"
                placeholder="请输入节能描述"
              />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="text" @click="cancel">取 消</el-button>
        <el-button type="primary" @click="skillsubmitForm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import {
  updateTBlogpersonalinfo,
  getTBlogpersonalinfo,
} from "@/api/blog/tBlogpersonalinfo.js";
import {
  listTBlogskill,
  addTBlogskill,
  delTBlogskill,
  updateTBlogskill,
  getTBlogskill,
} from "@/api/blog/tBlogskill.js";
export default {
  name: "tblogpersonalinfo",
  data() {
    return {
      labelWidth: "100px",
      formLabelWidth: "100px",
      // 操作类型 1、add 2、edit
      opertype: 2,
      // 表单参数
      form: {},
      skillform: {},
      // 性别选项列表 格式 eg:{ dictLabel: '标签', dictValue: '0'}
      sexOptions: [],
      // 提交按钮是否显示
      btnSubmitVisible: true,
      // 表单校验
      rules: {},
      // 弹出层标题
      skilltitle: "",
      // 操作类型 1、add 2、edit
      skillopertype: 0,
      // 是否显示弹出层
      skillopen: false,
      //技能列表
      skillList: [],
    };
  },
  created() {
    this.getQuery();
    this.getSkillList();
    var dictParams = [{ dictType: "sys_user_sex", columnName: "sexOptions" }];
    this.getDicts(dictParams).then((response) => {
      response.data.forEach((element) => {
        this[element.columnName] = element.list;
      });
    });
  },
  methods: {
    //获取详情
    getQuery() {
      getTBlogpersonalinfo(1).then((res) => {
        if (res.code === 200) {
          this.form = res.data;
        }
      });
    },
    //获取技能列表
    getSkillList() {
      listTBlogskill().then((res) => {
        debugger;
        if (res.code === 200) {
          this.skillList = res.data.result;
        }
      });
    },
    //图片上传成功方法
    handleUploadSuccess(column, filelist) {
      this.form[column] = filelist;
    },
    // 性别字典翻译
    sexFormat(row, column) {
      return this.selectDictLabel(this.sexOptions, row.sex);
    },
    // 重置数据表单
    skillreset() {
      this.skillform = {
        name: undefined,
        picIcon: undefined,
        des: undefined,
      };
      this.resetForm("skillform");
    },
    /** 新增按钮操作 */
    handleSkillAdd() {
      this.skillreset();
      this.skillopen = true;
      this.skilltitle = "添加";
      this.skillopertype = 1;
    },
    /** 删除按钮操作 */
    handleSkillDelete(row) {
      const Ids = row.id || this.ids;

      this.$confirm('是否确认删除参数编号为"' + Ids + '"的数据项？')
        .then(function () {
          return delTBlogskill(Ids);
        })
        .then(() => {
          this.getSkillList();
          this.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 修改按钮操作 */
    handleSkillUpdate(row) {
      this.skillreset();
      const id = row.id || this.ids;
      getTBlogskill(id).then((res) => {
        const { code, data } = res;
        if (code == 200) {
          this.skillopen = true;
          this.skilltitle = "修改数据";
          this.skillopertype = 2;

          this.skillform = {
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
          if (this.form.id != undefined && this.opertype === 2) {
            updateTBlogpersonalinfo(this.form)
              .then((res) => {
                this.msgSuccess("修改成功");
              })
              .catch((err) => {
                //TODO 错误逻辑
              });
          }
        }
      });
    },
    skillsubmitForm: function () {
      this.$refs["skillform"].validate((valid) => {
        if (valid) {
          console.log(JSON.stringify(this.skillform));

          if (this.skillform.id != undefined && this.skillopertype === 2) {
            updateTBlogskill(this.skillform)
              .then((res) => {
                this.msgSuccess("修改成功");
                this.skillopen = false;
                this.getSkillList();
              })
              .catch((err) => {
                //TODO 错误逻辑
              });
          } else {
            addTBlogskill(this.skillform)
              .then((res) => {
                this.msgSuccess("新增成功");
                this.skillopen = false;
                this.getSkillList();
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
      this.skillopen = false;
      this.skillreset();
    },
  },
};
</script>
<style>
.e-icon {
  font-size: 16px;
}
.button-new-tag {
  margin-left: 10px;
  padding-top: 0;
  padding-bottom: 0;
}
.el-tag + .el-tag {
  margin-left: 10px;
}
</style>