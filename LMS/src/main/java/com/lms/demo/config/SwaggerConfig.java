package com.lms.demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@Configuration
public class SwaggerConfig {
	
	@Bean
	public Docket userAPI()
	{
		return new Docket(DocumentationType.SWAGGER_12).select().
				apis(RequestHandlerSelectors.basePackage("com.lms.demo.controller")).paths(PathSelectors.regex("/api.*"))
				.build().apiInfo(metaInfo());
	}
	private ApiInfo metaInfo() {

    ApiInfo apiInfo = new ApiInfo(
            "Swagger+ Spring Boot",
            "Swagger API tutorial",
            "1.0",
            "Terms of Service",
            new Contact("Himanshu", "Him2k",
                    "upadhyay.himansh@gmail.com"),
            "Apache License Version 2.0",
            "https://www.apache.org/licesen.html"
    );

    return apiInfo;
}

}
