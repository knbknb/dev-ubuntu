FROM gitpod/workspace-full-vnc

USER root

SHELL [ "/bin/bash", "-c" ]

RUN set -euxo pipefail; \
  apt-get update; \
  apt-get install -qq linux-headers-`uname -r`; \
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -; \
  add-apt-repository -y "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"; \
  apt-get install -qq virtualbox-6.0

RUN set -eux; \
  wget https://storage.googleapis.com/shellcheck/shellcheck-stable.linux.x86_64.tar.xz; \
  tar xf shellcheck-stable.linux.x86_64.tar.xz; \
  mv shellcheck-stable/shellcheck /usr/local/bin; \
  rm -rf shellcheck-stable*

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#
# RUN sudo apt-get -q update && #     sudo apt-get install -yq bastet && #     sudo rm -rf /var/lib/apt/lists/*
#
# More information: https://www.gitpod.io/docs/42_config_docker/
