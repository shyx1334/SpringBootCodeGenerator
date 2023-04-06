<#if isWithPackage?? && isWithPackage==true>package ${packageName}.entity;</#if>

<#if isAutoImport?? && isAutoImport==true>
    <#if isLombok?? && isLombok==true>import lombok.Data;</#if>
import java.util.Date;
import java.util.List;
import java.io.Serializable;
<#if isSwagger?? && isSwagger==true>
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;</#if>
</#if>
/**
 * @description ${classInfo.classComment}
 * @author ${authorName}
 * @date ${.now?string('yyyy-MM-dd')}
 */<#if isLombok?? && isLombok==true>
@Data</#if><#if isSwagger?? && isSwagger==true>
@ApiModel("${classInfo.classComment}")</#if>
public class ${classInfo.className}Po implements Serializable {

    private static final long serialVersionUID = 1L;

<#if classInfo.fieldList?? && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
    <#if isComment?? && isComment==true>/**
     * ${fieldItem.fieldComment}
     */</#if><#if isSwagger?? && isSwagger==true>
    @ApiModelProperty("${fieldItem.fieldComment}")</#if>
    private ${fieldItem.fieldClass} ${fieldItem.fieldName};
    </#list>
</#if>

<#if classInfo.fieldList?? && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        <#if isLombok?? && isLombok==false>
    public ${fieldItem.fieldClass} get${fieldItem.fieldName?cap_first}() {
        return ${fieldItem.fieldName};
    }

    public ${classInfo.className}Po set${fieldItem.fieldName?cap_first}(${fieldItem.fieldClass} ${fieldItem.fieldName}) {
        this.${fieldItem.fieldName} = ${fieldItem.fieldName};
        return this;
    }

    </#if>
    </#list>
</#if>
    public ${classInfo.className}Po() {}
}
