<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${packageName}.dao.${classInfo.className}Dao">

    <resultMap id="BaseResultMap" type="${packageName}.po.${classInfo.className}Po">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
                <result column="${fieldItem.columnName}" property="${fieldItem.fieldName}" jdbcType="${fieldItem.jdbcType}"/>
            </#list>
        </#if>
    </resultMap>

    <sql id="base_column">
        <#if classInfo.fieldList?? && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem >${fieldItem.columnName}<#if fieldItem_has_next>, </#if></#list>
        </#if>
    </sql>

    <sql id="base_where">
        <where>
        <#if classInfo.fieldList?? && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem >
        <if test="${fieldItem.fieldName} != null<#if fieldItem.fieldClass ="String"> and ${fieldItem.fieldName} != ''</#if>">
            and ${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}}
        ${r"</if>"}
            </#list>
            </#if>
        </where>
    </sql>

    <insert id="insert" useGeneratedKeys="true" keyColumn="id" keyProperty="id" parameterType="${packageName}.po.${classInfo.className}Po">
        INSERT INTO ${classInfo.originTableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    <#if fieldItem.columnName != "id" >
                        <if test="null != ${fieldItem.fieldName} <#if fieldItem.fieldClass ="String">and '' != ${fieldItem.fieldName}</#if>">
                        ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
                        ${r"</if>"}
                    </#if>
                </#list>
            </#if>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    <#if fieldItem.columnName != "id" >
                    <#--<#if fieldItem.columnName="addtime" || fieldItem.columnName="updatetime" >
                    ${r"<if test ='null != "}${fieldItem.fieldName}${r"'>"}
                        NOW()<#if fieldItem_has_next>,</#if>
                    ${r"</if>"}
                    <#else>-->
                        <if test="null != ${fieldItem.fieldName} <#if fieldItem.fieldClass ="String">and '' != ${fieldItem.fieldName}</#if>">
                        ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>
                        ${r"</if>"}
                    <#--</#if>-->
                    </#if>
                </#list>
            </#if>
        </trim>
    </insert>

    <insert id="insertBatch" useGeneratedKeys="true" keyColumn="id" keyProperty="id" parameterType="${packageName}.po.${classInfo.className}Po">
        INSERT INTO ${classInfo.originTableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?? && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
            <#if fieldItem.columnName != "id" >
                ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
                </#if>
                </#list>
             </#if>
        </trim>
        values
        <foreach collection="list" item="item" separator=",">
            <trim prefix=" (" suffix=")" suffixOverrides=",">
                <#if classInfo.fieldList?? && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" >
                ${r"#{"}item.${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>
                </#if>
                </#list>
                </#if>
            </trim>
        </foreach>
    </insert>

    <delete id="delete" >
        DELETE FROM ${classInfo.originTableName}
        WHERE id = ${r"#{id}"}
    </delete>

    <update id="update" parameterType="${packageName}.po.${classInfo.className}Po">
        UPDATE ${classInfo.originTableName}
        <set>
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id" && fieldItem.columnName != "AddTime" && fieldItem.columnName != "UpdateTime" >
                    <if test="null != ${fieldItem.fieldName} <#if fieldItem.fieldClass ="String">and '' != ${fieldItem.fieldName}</#if>">${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName}${r"}"}<#if fieldItem_has_next>,</#if>${r"</if>"}
                </#if>
            </#list>
        </set>
        WHERE id = ${r"#{"}id${r"}"}
    </update>


    <select id="getByPrimaryKey" resultMap="BaseResultMap">
        SELECT <include refid="base_column" />
        FROM ${classInfo.originTableName}
        WHERE id = ${r"#{id}"}
    </select>

    <select id="pageList" resultMap="BaseResultMap">
        SELECT <include refid="base_column" />
        FROM ${classInfo.originTableName}
        <include refid="base_where"/>
        <if test="limit != null and offset != null">
            LIMIT ${r"#{limit}"}, ${r"#{offset}"}
        </if>
    </select>

    <select id="pageListCnt" resultType="java.lang.Integer">
        SELECT count(1)
        FROM ${classInfo.originTableName}
        <include refid="base_where"/>
    </select>

</mapper>
