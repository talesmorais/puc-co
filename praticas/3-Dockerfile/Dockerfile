FROM node as builder

WORKDIR /app
ENV PLUGIN_MANAGER https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.11/jenkins-plugin-manager-2.12.11.jar
ADD . . 
RUN npm install && npm build


FROM node-alpine
WORKDIR /app
COPY --from=builder /node_modudes/ packages.json .next/ ./
ENTRYPOINT [ "node" "start"]
















ENV USER tales



ARG VERSION 1.1

LABEL sre.co.version="${VERSION}"

WORKDIR /app

RUN mkdir -p tales
RUN echo $USER
RUN echo $VERSION
COPY jenkins-war-2.422.war /bin/jenkins.war

USER root

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/jenkins.sh"]
