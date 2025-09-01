FROM debian:latest

RUN apt update && \
    apt full-upgrade -y && \
    apt autoremove --purge -y && \
    apt install nftables wget -y && \
    rm -rf /var/lib/apt/lists/* && \
    wget -O fakehttp-linux-x86_64.tar.gz https://github.com/MikeWang000000/FakeHTTP/releases/download/0.9.18/fakehttp-linux-x86_64.tar.gz && \
    tar xf fakehttp-linux-x86_64.tar.gz && rm -f fakehttp-linux-x86_64.tar.gz && \
    mv -f fakehttp-linux-x86_64/fakehttp /usr/bin/fakehttp && \
    rm -fr fakehttp-linux-x86_64

ENTRYPOINT ["fakehttp"]
CMD []
