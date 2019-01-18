FROM phusion/baseimage:0.11

RUN install_clean gcc cmake make libtool-bin wget python automake bison libglib2.0 git \
    libssl-dev nettle-dev flex python3 build-essential python3-setuptools python3-dev screen gdb libpixman-1-dev

WORKDIR /opt
COPY build_qemu.sh /opt/build_qemu.sh
RUN ./build_qemu.sh "qemu-3.0.0"
ENV PATH="/opt/qemu-targets:${PATH}"

RUN apt-get remove -y gcc cmake make gdb libtool-bin wget python automake bison git \
    libssl-dev nettle-dev flex python3 build-essential python3-setuptools python3-dev screen libpixman-1-dev && \
    apt-get autoremove -y && apt-get clean -y
