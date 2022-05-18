<template>
  <div class="app-container">
    <!-- :model属性用于表单验证使用 比如下面的el-form-item 的 prop属性用于对表单值进行验证操作 -->
    <el-form :model="queryParams" size="small" label-position="right" inline ref="queryForm" :label-width="labelWidth" v-show="showSearch" 
      @submit.native.prevent>
          				    
      <el-form-item label="名称" prop="title">
        <el-input v-model="queryParams.title" placeholder="请输入名称" />
      </el-form-item>
    				    
      <el-form-item label="类型" prop="typeName">
        <el-select v-model="queryParams.typeName" placeholder="请选择类型">
          <el-option v-for="item in typeNameOptions" :key="item.dictValue" :label="item.dictLabel" :value="item.dictValue"></el-option>
        </el-select>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>
    <!-- 工具区域 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" v-hasPermi="['blog:blogproject:add']" plain icon="el-icon-plus" size="mini" @click="handleAdd">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" :disabled="single" v-hasPermi="['blog:blogproject:edit']" plain icon="el-icon-edit" size="mini" @click="handleUpdate">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" :disabled="multiple" v-hasPermi="['blog:blogproject:delete']" plain icon="el-icon-delete" size="mini" @click="handleDelete">删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 数据区域 -->
    <el-table :data="dataList" v-loading="loading" ref="table" border highlight-current-row @sort-change="sortChange" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="50" align="center"/>
      <el-table-column prop="id" label="id" align="center" />
      <el-table-column prop="content" label="描述" align="center" :show-overflow-tooltip="true" />
      <el-table-column prop="title" label="名称" align="center" :show-overflow-tooltip="true" />
      <el-table-column prop="typeName" label="类型" align="center">
        <template slot-scope="scope">
          <dict-tag :options="typeNameOptions" :value="scope.row.typeName" />
        </template>
      </el-table-column>
      <el-table-column prop="picUrl" label="图片" align="center">
        <template slot-scope="scope">
          <el-image class="table-td-thumb" fit="contain" :src="scope.row.picUrl" :preview-src-list="[scope.row.picUrl]">
            <div slot="error"><i class="el-icon-document" /></div>
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="techs" label="技术栈" align="center" :show-overflow-tooltip="true" />
      <el-table-column prop="url" label="项目地址" align="center" :show-overflow-tooltip="true" />
      <el-table-column prop="createTime" label="创建时间" align="center" :show-overflow-tooltip="true" />

      <el-table-column label="操作" align="center" width="140">
        <template slot-scope="scope">
          <el-button size="mini" v-hasPermi="['blog:blogproject:edit']" type="success" icon="el-icon-edit" title="编辑" 
            @click="handleUpdate(scope.row)"></el-button>      
          <el-button size="mini" v-hasPermi="['blog:blogproject:delete']" type="danger" icon="el-icon-delete" title="删除" 
            @click="handleDelete(scope.row)"></el-button>
        </template>
      </el-table-column>
    </el-table>
    <pagination class="mt10" background :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize" @pagination="getList" />

    <!-- 添加或修改博客项目表对话框 -->
    <el-dialog :title="title" :lock-scroll="false" :visible.sync="open" >
      <el-form ref="form" :model="form" :rules="rules" :label-width="formLabelWidth">
        <el-row :gutter="20">
    <el-col :lg="12" v-if="opertype == 2">
      <el-form-item label="id">{{form.id}}</el-form-item>
    </el-col>
    <el-col :lg="24">
      <el-form-item label="描述" prop="content">
        <el-input type="textarea" v-model="form.content" placeholder="请输入描述"/>
      </el-form-item>
    </el-col>
    <el-col :lg="12">
      <el-form-item label="名称" prop="title">
        <el-input v-model="form.title" placeholder="请输入名称" />
      </el-form-item>
    </el-col>
    <el-col :lg="12">
      <el-form-item label="类型" prop="typeName">
        <el-select v-model="form.typeName" placeholder="请选择类型"> 
          <el-option v-for="item in typeNameOptions" :key="item.dictValue" :label="item.dictLabel" :value="item.dictValue"></el-option>
        </el-select>
      </el-form-item>
    </el-col>
    <el-col :lg="24">
      <el-form-item label="图片" prop="picUrl">
        <UploadImage v-model="form.picUrl" :nameMaxLength="50" column="picUrl" @input="handleUploadSuccess" />
      </el-form-item>
    </el-col>
    <el-col :lg="12">
      <el-form-item label="技术栈" prop="techs">
        <el-input v-model="form.techs" placeholder="请输入技术栈" />
      </el-form-item>
    </el-col>
    <el-col :lg="12">
      <el-form-item label="项目地址" prop="url">
        <el-input v-model="form.url" placeholder="请输入项目地址" />
      </el-form-item>
    </el-col>

        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="text" @click="cancel">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>
<script>
import { 
  listTBlogproject,
  addTBlogproject,
  delTBlogproject,
  updateTBlogproject,
  getTBlogproject,
} from '@/api/blog/tBlogproject.js';

export default {
  name: "tblogproject",
  data() {
    return {
      labelWidth: "100px",
      formLabelWidth:"100px",
      // 选中id数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 遮罩层
      loading: false,
      // 显示搜索条件
      showSearch: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sort: undefined,
        sortType: undefined,
        title: undefined,
        typeName: undefined,
      },
      // 弹出层标题
      title: "",
      // 操作类型 1、add 2、edit
      opertype: 0,
      // 是否显示弹出层
      open: false,
      // 表单参数
      form: {},
      columns: [
        { index: 0, key: 'id', label: ``, checked:  true  },
        { index: 1, key: 'content', label: `描述`, checked:  true  },
        { index: 2, key: 'title', label: `名称`, checked:  true  },
        { index: 3, key: 'typeName', label: `类型`, checked:  true  },
        { index: 4, key: 'picUrl', label: `图片`, checked:  true  },
        { index: 5, key: 'techs', label: `技术栈`, checked:  true  },
        { index: 6, key: 'url', label: `项目地址`, checked:  true  },
        { index: 7, key: 'createTime', label: `创建时间`, checked:  true  },
      ],
      // 类型选项列表 格式 eg:{ dictLabel: '标签', dictValue: '0'}
      typeNameOptions: [],
      // 数据列表
      dataList: [],
      // 总记录数
      total: 0,
      // 提交按钮是否显示
      btnSubmitVisible: true,
      // 表单校验
      rules: {
      },
    };
  },
  created() {    
    // 列表数据查询
    this.getList();

    var dictParams = [
      { dictType: "blog_project_type", columnName: "typeNameOptions" },
    ];
    this.getDicts(dictParams).then((response) => {
      response.data.forEach((element) => {
        this[element.columnName] = element.list;
      });
    });
  },
  methods: {
    // 查询数据
    getList() {
      this.loading = true;
      listTBlogproject(this.queryParams).then(res => {
         if (res.code == 200) {
           this.dataList = res.data.result;
           this.total = res.data.totalNum;
           this.loading = false;
         }
       })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 重置数据表单
    reset() {
      this.form = {
        content: undefined,
        title: undefined,
        typeName: undefined,
        picUrl: undefined,
        techs: undefined,
        url: undefined,
      };
      this.resetForm("form");
    },
    // 重置查询操作
    resetQuery() {
      this.timeRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length != 1
      this.multiple = !selection.length;
    },
     // 自定义排序
    sortChange(column) {
      if (column.prop == null || column.order == null) {
        this.queryParams.sort = undefined;
        this.queryParams.sortType = undefined;
      } else {
        this.queryParams.sort = column.prop;
        this.queryParams.sortType = column.order;
      }

      this.handleQuery();
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加";
      this.opertype = 1;
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const Ids = row.id || this.ids;

      this.$confirm('是否确认删除参数编号为"' + Ids + '"的数据项？')
        .then(function () {
          return delTBlogproject(Ids);
        })
        .then(() => {
          this.handleQuery();
          this.msgSuccess("删除成功");
        })
        .catch(() => {});
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getTBlogproject(id).then((res) => {
        const { code, data } = res;
        if (code == 200) {
          this.open = true;
          this.title = "修改数据";
          this.opertype = 2;

          this.form = {
            ...data,
          };
        }
      });
    },
    //图片上传成功方法
    handleUploadSuccess(column, filelist) {
      this.form[column] = filelist;
    },
    // 类型字典翻译
    typeNameFormat(row, column) {
      return this.selectDictLabel(this.typeNameOptions, row.typeName);
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          // console.log(JSON.stringify(this.form));
          
          if (this.form.id != undefined && this.opertype === 2) {
            updateTBlogproject(this.form)
              .then((res) => {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
            })
            .catch((err) => {
                //TODO 错误逻辑
              });
          } else {
            addTBlogproject(this.form)
              .then((res) => {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
            })
            .catch((err) => {
                //TODO 错误逻辑
              });
          }
        }
      });
    },
  },
};
</script>