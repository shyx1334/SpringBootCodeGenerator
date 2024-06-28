package com.softdev.system.generator.util;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

/**
 * @author lvyanpu
 */
public final class MysqlJavaTypeUtil {
    public static final  HashMap<String, String> mysqlJavaTypeMap = new HashMap<>();
    public static final  HashMap<String, String> javaMysqlTypeMap = new HashMap<>();
    public static final  HashMap<String, String> mysqlJdbcTypeMap = new HashMap<>();
    public static final  HashMap<String, String> mysqlSwaggerTypeMap = new HashMap<>();

    static{
        mysqlJavaTypeMap.put("bigint","Long");
        mysqlJavaTypeMap.put("int","Integer");
        mysqlJavaTypeMap.put("tinyint","Integer");
        mysqlJavaTypeMap.put("smallint","Integer");
        mysqlJavaTypeMap.put("mediumint","Integer");
        mysqlJavaTypeMap.put("integer","Integer");
        //小数
        mysqlJavaTypeMap.put("float","Float");
        mysqlJavaTypeMap.put("double","Double");
        mysqlJavaTypeMap.put("decimal","Double");
        //bool
        mysqlJavaTypeMap.put("bit","Boolean");
        //字符串
        mysqlJavaTypeMap.put("char","String");
        mysqlJavaTypeMap.put("varchar","String");
        mysqlJavaTypeMap.put("tinytext","String");
        mysqlJavaTypeMap.put("text","String");
        mysqlJavaTypeMap.put("mediumtext","String");
        mysqlJavaTypeMap.put("longtext","String");
        //日期
        mysqlJavaTypeMap.put("date","Date");
        mysqlJavaTypeMap.put("datetime","Date");
        mysqlJavaTypeMap.put("timestamp","Date");


        javaMysqlTypeMap.put("Integer", "int");
        javaMysqlTypeMap.put("int", "int");
        javaMysqlTypeMap.put("Long", "bigint");
        javaMysqlTypeMap.put("long", "bigint");
        javaMysqlTypeMap.put("Double", "double");
        javaMysqlTypeMap.put("double", "double");
        javaMysqlTypeMap.put("Float", "float");
        javaMysqlTypeMap.put("float", "float");
        javaMysqlTypeMap.put("BigDecimal", "decimal");
        javaMysqlTypeMap.put("String", "varchar");
        javaMysqlTypeMap.put("Date", "datetime");
        javaMysqlTypeMap.put("LocalDateTime", "datetime");
        javaMysqlTypeMap.put("LocalDate", "date");
        javaMysqlTypeMap.put("Boolean","bit");
        javaMysqlTypeMap.put("boolean","bit");




        mysqlJdbcTypeMap.put("Integer","INTEGER");
        mysqlJdbcTypeMap.put("Float","FLOAT");
        mysqlJdbcTypeMap.put("Long","BIGINT");
        mysqlJdbcTypeMap.put("String","VARCHAR");
        mysqlJdbcTypeMap.put("Boolean","BOOLEAN");
        mysqlJdbcTypeMap.put("Double","DOUBLE");
        mysqlJdbcTypeMap.put("Date","TIMESTAMP");


        mysqlSwaggerTypeMap.put("bigint","integer");
        mysqlSwaggerTypeMap.put("int","integer");
        mysqlSwaggerTypeMap.put("tinyint","integer");
        mysqlSwaggerTypeMap.put("smallint","integer");
        mysqlSwaggerTypeMap.put("mediumint","integer");
        mysqlSwaggerTypeMap.put("integer","integer");
        mysqlSwaggerTypeMap.put("boolean","boolean");
        mysqlSwaggerTypeMap.put("float","number");
        mysqlSwaggerTypeMap.put("double","number");
        mysqlSwaggerTypeMap.put("decimal","Double");
    }

    public static HashMap<String, String> getMysqlJavaTypeMap() {
        return mysqlJavaTypeMap;
    }

    public static Map<String, String> getMysqlJdbcTypeMap() {
        return mysqlJdbcTypeMap;
    }


    public static HashMap<String, String> getMysqlSwaggerTypeMap() {
        return mysqlSwaggerTypeMap;
    }
    public static HashMap<String, String> getMysqlTypeByJavaType(){
        return javaMysqlTypeMap;
    }
}
