FROM openjdk:8

# can be passed during Docker build as build time environment for github branch to pickup configuration from.
ARG spring_config_label

# can be passed during Docker build as build time environment for spring profiles active 
ARG active_profile

# environment variable to pass active profile such as DEV, QA etc at docker runtime
ENV active_profile_env=${active_profile}

# environment variable to pass github branch to pickup configuration from, at docker runtime
ENV spring_config_label_env = ${spring_config_label}

COPY ./target/kernel-syncdata-service-*.jar kernel-syncdata-service.jar

EXPOSE 8089

CMD ["java","-jar", "-Dspring.cloud.config.label=${spring_config_label_env}", "-Dspring.profiles.active=${active_profile_env}","kernel-syncdata-service.jar"]