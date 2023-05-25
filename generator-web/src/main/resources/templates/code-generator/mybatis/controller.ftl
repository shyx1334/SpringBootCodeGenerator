import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.amap.aos.monitor.base.utils.DateTimeUtils;
import cn.hutool.core.lang.Assert;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;

/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */
@Slf4j
@RestController
@RequestMapping(value = "/${classInfo.className?uncap_first}")
public class ${classInfo.className}Controller {

    @Resource
    private ${classInfo.className}Service ${classInfo.className?uncap_first}Service;

    /**
    * 新增
    *
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/insert")
    public JSONObject insert(${classInfo.className} ${classInfo.className?uncap_first}){
        try {
            Assert.notBlank(${classInfo.className?uncap_first},"resourceKey is empty!");
            log.info("${classInfo.className}Controller insert operator={}, param={}",
            getUser(request).getEmpId(), JSON.toJSONString(resourceChange));
            return ResUtil.ok(${classInfo.className?uncap_first}Service.insert(${classInfo.className?uncap_first}));
        } catch (Exception e) {
            log.error("${classInfo.className}Controller insert error", e);
            return ResUtil.fail(ResultCodeEnum.FAILURE.getCode(), e);
        }
    }

    /**
    * 刪除
    *
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/delete")
    public JSONObject delete(Long id){
        try {
            Assert.notBlank(id,"[id] is empty!");
            log.info("${classInfo.className}Controller delete operator={}, param={}",
            getUser(request).getEmpId(), JSON.toJSONString(resourceChange));
            return ResUtil.ok(${classInfo.className?uncap_first}Service.delete(id));
        } catch (Exception e) {
            log.error("${classInfo.className}Controller delete error", e);
            return ResUtil.fail(ResultCodeEnum.FAILURE.getCode(), e);
        }
    }

    /**
    * 更新
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @PostMapping("/update")
    public JSONObject update(${classInfo.className} ${classInfo.className?uncap_first}){
        try {
            Assert.notBlank(${classInfo.className?uncap_first}.getId(), "[id] is empty!");
            log.info("${classInfo.className}Controller update operator={}, param={}",
            getUser(request).getEmpId(), JSON.toJSONString(resourceChange));
            return ResUtil.ok(${classInfo.className?uncap_first}Service.update(${classInfo.className?uncap_first}));
        } catch (Exception e) {
            log.error("${classInfo.className}Controller update error", e);
            return ResUtil.fail(ResultCodeEnum.FAILURE.getCode(), e);
        }
    }

    /**
    * 查询 根据主键 id 查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @GetMapping("/getOne")
    public JSONObject getOne(Long id){
        try {
            Assert.notBlank(id, "[id] is empty!");
            return ResUtil.ok(${classInfo.className?uncap_first}Service.getOne(id));
        } catch (Exception e) {
            log.error("${classInfo.className}Controller getOne error", e);
            return ResUtil.fail(ResultCodeEnum.FAILURE.getCode(), e);
        }
    }

    /**
    * 查询 分页查询
    * @author ${authorName}
    * @date ${.now?string('yyyy/MM/dd')}
    **/
    @RequestMapping("/pager")
    public JSONObject pager(${classInfo.className?uncap_first}Param param) {
        try {
            if (StringUtils.isEmpty(param.getDateRange())) {
                Date end = new Date();
                param.setStart(DateTimeUtils.getPreDay(end, 1));
                param.setEnd(end);
            }
            return ResUtil.ok(${classInfo.className?uncap_first}Service.pager(param));
        } catch (Exception e) {
            log.error("${classInfo.className}Controller pager error", e);
            return ResUtil.fail(ResultCodeEnum.FAILURE.getCode(), e);
        }
    }

}
