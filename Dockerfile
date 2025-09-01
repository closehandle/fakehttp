FROM debian:latest

RUN apt update && \
    apt full-upgrade -y && \
    apt autoremove --purge -y && \
    apt install libnetfilter-queue-dev libnfnetlink-dev build-essential git -y && \
    git clone https://github.com/MikeWang000000/FakeHTTP && cd FakeHTTP && \
    make -j$(nproc) STATIC=1 && \
    strip -s -w src/fakehttp

FROM debian:latest
COPY --from=0 /FakeHTTP/src/fakehttp /usr/bin/fakehttp

RUN apt update && \
    apt full-upgrade -y && \
    apt autoremove --purge -y && \
    apt install nftables -y && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["fakehttp"]
CMD []
