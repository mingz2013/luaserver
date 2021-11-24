FROM centos
RUN mkdir /build
WORKDIR /build


RUN yum install epel-release -y

RUN yum install wget gcc unzip git cmake -y


RUN cd /build
RUN wget https://luajit.org/download/LuaJIT-2.1.0-beta3.tar.gz
RUN tar zxpf LuaJIT-2.1.0-beta3.tar.gz
RUN cd LuaJIT-2.1.0-beta3 && make install
RUN ln -sf luajit-2.1.0-beta3 /usr/local/bin/luajit

RUN cd /build

RUN wget https://luarocks.org/releases/luarocks-3.7.0.tar.gz
RUN tar zxpf luarocks-3.7.0.tar.gz
RUN cd luarocks-3.7.0 && ./configure --with-lua-include=/usr/local/include/luajit-2.1/ --prefix=/usr/local && make install

RUN cd /build

RUN luarocks install lua-cjson
RUN luarocks install lua-protobuf
RUN luarocks install luafilesystem
RUN luarocks install luasocket
RUN luarocks install lpeg
RUN luarocks install struct


RUN luarocks install lua-hiredis-with-5.2-fix

RUN yum install mongo-c-driver mongo-c-driver-devel mongo-c-driver-libs -y

RUN luarocks install lua-mongo

#RUN luarocks install threads

RUN mkdir /app
WORKDIR /app


CMD ["/usr/local/bin/luajit"]

