FROM ubuntu:20.04

ARG USERNAME=nosfill
ENV TZ=Asia/Tokyo

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.jaist.ac.jp/pub/Linux/ubuntu/%g" /etc/apt/sources.list
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update \
   && apt-get dist-upgrade -y \
   && apt-get install -y --no-install-recommends \
      sudo \
      git \
      software-properties-common \
      build-essential \
      curl \
      ca-certificates \
   && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 ${USERNAME} \
   && useradd -g ${USERNAME} -G sudo --create-home -s /bin/bash ${USERNAME} \
   && echo "${USERNAME}:${USERNAME}" | chpasswd
RUN echo "Defaults visiblepw" >> /etc/sudoers
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USERNAME}
WORKDIR /home/${USERNAME}/
CMD ["/bin/bash"]