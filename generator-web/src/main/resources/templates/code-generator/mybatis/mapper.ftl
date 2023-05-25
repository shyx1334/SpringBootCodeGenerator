<#if isAutoImport?exists && isAutoImport==true>

</#if>
import org.apache.ibatis.annotations.Param;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Mapper
@Repository
public interface ${classInfo.className}Dao {

    /**
    * 新增
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    * @return 受影响行数
    **/
    int insert(${classInfo.className}Po ${classInfo.className?uncap_first});

    /**
    * 批量新增
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    * @return 受影响行数
    **/
    int insertBatch(@Param("list") List<${classInfo.className}Po> ${classInfo.className?uncap_first}List);

    /**
    * 刪除
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    int delete(int id);

    /**
    * 更新
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    int update(${classInfo.className}Po ${classInfo.className?uncap_first});

    /**
    * 查询 根据主键 id 查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    ${classInfo.className}Po load(int id);

    /**
    * 查询 分页查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    List<${classInfo.className}Po> pageList(DefenseBaseParam param);

    /**
    * 查询 分页数查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    int pageListCnt(DefenseBaseParam param);

}
