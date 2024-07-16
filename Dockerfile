FROM hashicorp/tfc-agent:latest

USER root

# Example: Add your own certificates to the environment
# COPY proxy.pem /usr/local/share/ca-certificates/proxy.crt
# RUN update-ca-certificates

RUN mkdir /.tfc-agent && \
    chmod 770 /.tfc-agent

ADD hooks /.tfc-agent/hooks


RUN mkdir -p /home/tfc-agent/.tfc-agent 
ADD --chown=tfc-agent:tfc-agent hooks /home/tfc-agent/.tfc-agent/hooks

USER tfc-agent
 

