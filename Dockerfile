FROM eystsen/altoro:latest

# add in seeker JAVA agent
ENV SEEKER_SERVER_URL=https://poc271.seeker.synopsys.com:443
ENV SEEKER_PROJECT_KEY=HVP-poc-altoro
ENV SEEKER_AGENT_NAME=HVP-poc-agent-altoro
RUN sh -c "$( curl -k -X GET -fsSL --header 'Accept: application/x-sh' 'https://poc271.seeker.synopsys.com/rest/api/latest/installers/agents/scripts/JAVA?osFamily=LINUX&downloadWith=curl&projectKey=HVP-poc-altoro&webServer=OTHER&flavor=DEFAULT&agentName=&accessToken=')"

ENV JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -javaagent:/usr/local/tomcat/seeker/seeker-agent.jar"
ENV SEEKER_AGENT_APP_OPENAPI_SPEC_URL=http://localhost:8080/swagger/properties.json
# ENV SEEKER_AGENT_APP_OPENAPI_SPEC_FILE=/usr/local/tomcat/webapps/ROOT/swagger/properties.json

EXPOSE 8080
