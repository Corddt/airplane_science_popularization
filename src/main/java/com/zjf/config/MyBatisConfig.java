package com.zjf.config;

import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;

import javax.sql.DataSource;
import java.util.Properties;

public class MyBatisConfig {
    /**配置PageInterceptor分页插件*/
    @Bean
    public PageInterceptor getPageInterceptor() {
        PageInterceptor pageIntercptor = new PageInterceptor();
        Properties properties = new Properties();
        properties.setProperty("value", "true");
        pageIntercptor.setProperties(properties);
        return pageIntercptor;
    }
    /*
    定义MyBatis的核心连接工厂bean
     */
    @Bean
    public SqlSessionFactoryBean getSqlSessionFactoryBean(@Autowired DataSource dataSource,@Autowired PageInterceptor pageIntercptor){
        SqlSessionFactoryBean ssfb = new SqlSessionFactoryBean();
        ssfb.setDataSource(dataSource);
        Interceptor[] plugins={pageIntercptor};
        ssfb.setPlugins(plugins);
        return ssfb;
    }
    /*
    定义MyBatis的映射扫描
     */
    @Bean
    public MapperScannerConfigurer getMapperScannerConfigurer(){
        MapperScannerConfigurer msc = new MapperScannerConfigurer();
        msc.setBasePackage("com.zjf.dao");
        return msc;
    }
}