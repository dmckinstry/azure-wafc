FROM microsoft/azure-cli:2.0.47

LABEL "name"="deploy-to-azure-wafc"
LABEL "maintainer"="David Staheli"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="Deploy to Azure Web App for Containers"
LABEL "com.github.actions.description"=""
LABEL "com.github.actions.icon"="triange"
LABEL "com.github.actions.color"="blue"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
