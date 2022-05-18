<template>
  <div>
    <el-container>
      <el-header>
        <el-row class="el-row" type="flex" justify="center">
          <el-button type="primary" @click="handleAdd">添加标签</el-button>
        </el-row>
      </el-header>
      <el-main>
        <el-row :gutter="20">
          <el-col v-if="dataList.length === 0" class="el-col">
            <el-empty description="没有标签数据"></el-empty>
          </el-col>

          <el-col
            v-else
            class="el-col"
            :span="6"
            v-for="(tag, id) in dataList"
            :key="id"
          >
            <el-descriptions class="tags-container">
              <template slot="title">
                <span>标签名称</span>
                <span style="margin-left: 10px; color: #409eff">{{
                  tag.name
                }}</span>
              </template>
              <template slot="extra">
                <el-link
                  :underline="false"
                  type="primary"
                  @click="handleUpdate(tag)"
                  ><i class="el-icon-edit"></i
                ></el-link>
                <el-link
                  :underline="false"
                  type="danger"
                  style="margin-left: 5px"
                  icon="el-icon-delete"
                  @click="handleDelete(tag)"
                ></el-link>
              </template>
              <el-descriptions-item label="博客数量"
                ><el-tag size="small">{{
                  tag.articlesCount
                }}</el-tag></el-descriptions-item
              >
            </el-descriptions>
          </el-col>
        </el-row>
      </el-main>
    </el-container>

    <!-- 添加或修改菜单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="450px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-row>
          <el-col :lg="24">
            <el-form-item label="标签名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入菜单名称" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer" v-if="btnSubmitVisible">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listTags, addTag, updateTag, delTag } from "@/api/blog/tag.js";
export default {
  name: "tag",
  data() {
    return {
      // 提交按钮是否显示
      btnSubmitVisible: true,
      //弹出层标题
      title: "添加",
      // 是否显示弹出层
      open: false,
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "标签名称不能为空", trigger: "blur" },
        ],
      },
      //数据
      dataList: [],
    };
  },
  created() {
    this.getList();
  },
  methods: {
    // 查询数据
    getList() {
      listTags().then((res) => {
        if (res.code == 200) {
          this.dataList = res.data;
        }
      });
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加标签";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.form = row;
      this.open = true;
      this.title = "修改标签";
    },
    //删除数据
    handleDelete(row) {
      this.$confirm('是否确认删除名称为"' + row.name + '"的标签?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          return delTag(row.id);
        })
        .then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.btnSubmitVisible = true;
      this.form = {
        id: undefined,
        name: undefined,
      };
      this.resetForm("form");
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != undefined) {
            updateTag(this.form).then((response) => {
              this.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addTag(this.form).then((response) => {
              this.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
  },
};
</script>

<style>
.el-row {
  margin-top: 20px;
  margin-bottom: 20px;
}
.el-col {
  margin-top: 15px;
}
.tags-container {
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.12), 0 0 6px rgba(0, 0, 0, 0.04);
  border-radius: 4px;
  padding: 20px;
}
</style>