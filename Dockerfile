FROM maven:3-openjdk-8 AS packaging
RUN git clone https://github.com/QT-DevOps/game-of-life.git
RUN cd /game-of-life/ && mvn package

FROM tomcat:9.0.39-jdk8-openjdk-slim
LABEL author="khaja"
LABEL org="learningthoughts"
COPY --from=packaging /game-of-life/gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080
