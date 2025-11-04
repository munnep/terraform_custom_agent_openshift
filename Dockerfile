FROM hashicorp/tfc-agent:1.25.1 

USER root

# Example: Add your own certificates to the environment
# COPY proxy.pem /usr/local/share/ca-certificates/proxy.crt
# RUN update-ca-certificates

RUN mkdir /.tfc-agent && \
    chmod 770 /.tfc-agent && \
    # one of the following is needed to make sure that the agent works on openshift. Documentation updated
    # chmod 775 -R /home/tfc-agent 
    chmod o+rx /home/tfc-agent 

ADD hooks /.tfc-agent/hooks

# different because of openshift
# RUN mkdir -p /home/tfc-agent/.tfc-agent 
# ADD --chown=tfc-agent:tfc-agent hooks /home/tfc-agent/.tfc-agent/hooks

USER tfc-agent

