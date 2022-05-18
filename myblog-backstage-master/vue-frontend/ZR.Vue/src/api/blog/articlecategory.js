import request from '@/utils/request'

/**
* 文章类型分页查询
* @param {查询条件} data
*/
export function listArticlecategory(query) {
  return request({
    url: 'Blog/Articlecategory/list',
    method: 'get',
    params: query,
  })
}


/**
* 新增文章类型
* @param data
*/
export function addArticlecategory(data) {
  return request({
    url: 'Blog/Articlecategory',
    method: 'post',
    data: data,
  })
}

/**
* 修改文章类型
* @param data
*/
export function updateArticlecategory(data) {
  return request({
    url: 'Blog/Articlecategory',
    method: 'PUT',
    data: data,
  })
}

/**
* 获取文章类型详情
* @param {Id}
*/
export function getArticlecategory(id) {
  return request({
    url: 'Blog/Articlecategory/' + id,
    method: 'get'
  })
}

/**
* 删除文章类型
* @param {主键} pid
*/
export function delArticlecategory(pid) {
  return request({
    url: 'Blog/Articlecategory/' + pid,
    method: 'delete'
  })
}

// 导出文章类型
export function exportArticlecategory(query) {
  return request({
    url: 'Blog/Articlecategory/export',
    method: 'get',
    params: query
  })
}

