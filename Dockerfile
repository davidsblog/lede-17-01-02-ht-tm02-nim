FROM davidsblog/lede-17-01-02-ht-tm02-cc

RUN cd /home &&\
    git clone -b master git://github.com/nim-lang/Nim.git  &&\
    cd Nim &&\
    git clone -b master --depth 1 git://github.com/nim-lang/csources &&\
    cd csources && sh build.sh &&\
    cd .. &&\
    bin/nim c koch &&\
    ./koch boot -d:release

COPY config_nim.cfg /home/Nim/config/nim.cfg

ENV PATH /home/Nim/bin:$PATH
