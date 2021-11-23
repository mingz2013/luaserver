FROM centos
CMD mkdir /build
WORKDIR /build
CMD yum install epel-release -y

CMD yum install wget gcc unzip git cmake -y




CMD cd /build
CMD wget https://luajit.org/download/LuaJIT-2.1.0-beta3.tar.gz
CMD tar zxpf LuaJIT-2.1.0-beta3.tar.gz
CMD cd LuaJIT-2.1.0-beta3
CMD make install

CMD cd /build

CMD wget https://luarocks.org/releases/luarocks-3.7.0.tar.gz
CMD tar zxpf luarocks-3.7.0.tar.gz
CMD cd luarocks-3.7.0
CMD ./configure --with-lua-include=/usr/local/include/luajit-2.1/ --prefix=/usr/local
CMD ln -s /usr/local/bin/luarocks /usr/bin/luarocks
CMD ln -s /usr/local/bin/luarocks-admin /usr/bin/luarocks-admin
CMD make install


CMD luarocks install lua-cjson
CMD luarocks install lua-protobuf
CMD luarocks install luafilesystem
CMD luarocks install lua-hiredis-with-5.2-fix

CMD yum install mongo-c-driver mongo-c-driver-devel mongo-c-driver-libs -y

CMD luarocks install lua-mongo


