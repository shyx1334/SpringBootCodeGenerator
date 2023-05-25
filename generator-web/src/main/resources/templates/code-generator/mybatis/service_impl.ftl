<#if isAutoImport?exists && isAutoImport==true>
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Service
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

	@Resource
	private ${classInfo.className}Dao ${classInfo.className?uncap_first}Dao;

	/**
	  *  新增
	  * @param ${classInfo.className?uncap_first}
	  * @return
	  */
	public int insert(${classInfo.className}Po ${classInfo.className?uncap_first}) {
		if (Objects.isNull(${classInfo.className?uncap_first})) {
			return -1;
        }
		return ${classInfo.className?uncap_first}Dao.insert(${classInfo.className?uncap_first});
	}


	/**
	  *  删除
	  * @param id
	  * @return
	  */
	public int delete(Long id) {
		if (Objects.isNull(id) {
			return -1;
		}
		return ${classInfo.className?uncap_first}Dao.delete(${classInfo.className?uncap_first});
	}


	/**
	  *  根据主键更新
	  * @param resourceChange
	  * @return
	  */
	public int update(${classInfo.className}Po ${classInfo.className?uncap_first}) {
		if (Objects.isNull(${classInfo.className?uncap_first})) {
			return -1;
		}
		return ${classInfo.className?uncap_first}Dao.update(${classInfo.className?uncap_first});
	}


	/**
	  *  根据主键查询
	  * @param resourceChange
	  * @return
	  */
	public ${classInfo.className}Po getOne(Long id) {
		if (Objects.isNull(id) {
		return -1;
		}
		return ${classInfo.className?uncap_first}Dao.getByPrimaryKey(id);
	}


	/**
	  *  分页查询
	  * @param param 参数
	  * @return 结果
	  */
	public PageResult<${classInfo.className}Po> pager(${classInfo.className}Param param) {
		param.setLimit();
		int cnt = ${classInfo.className?uncap_first}Dao.pageListCnt(param);
		if (cnt <= 0) {
			return new PageResult<>(new Pager(cnt, param.getPageNum(), param.getPageSize()));
		}
		List<${classInfo.className}Po> pageList = ${classInfo.className?uncap_first}Dao.pageList(param);
		return new PageResult<>(pageList, new Pager(cnt, param.getPageNum(), param.getPageSize()));
	}

}
