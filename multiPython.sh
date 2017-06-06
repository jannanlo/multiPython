#!/bin/bash
#Time:2017-06-06
#Author:Jenner.Luo

PWD=$(pwd)

download_pkg(){
    local py_url=$1
    if [[ ! -n ${py_url} ]]; then
        py_url=https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
    fi
    local pkg_dir=${PWD}/softwares
    if [[ ! -d ${pkg_dir} ]]; then
        mkdir ${pkg_dir}
    fi
    wget -P ${pkg_dir} ${py_url}

    echo ${PWD}/${py_url##*/}   # Return package path
}

make_install(){
    local pkg_path=$1
    if [[ -n ${pkg_path} ]]; then
        local pkg_dir=${pkg_path%/*}
        local pkg_name=${pkg_path##*/}
        cd ${pkg_dir}
        tar -zxvf ${pkg_name}
        cd ${pkg_name%.*}
        ./configure --prefix=/usr/local --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib"
        make && make altinstall

    fi
}

install_tar_pkg(){
    local py_bin=$1
    local pkg_path=$2
    if [[ -n ${py_bin} && -n ${pkg_path} ]]; then
        local pkg_dir=${pkg_path%/*}
        local pkg_name=${pkg_path##*/}
        cd ${pkg_dir}
        
        if [[ ${pkg_name} =~ .zip$ ]]; then
            unzip ${pkg_name}
            cd ${pkg_name%.zip}
        elif [[ ${pkg_name} =~ .tar.* ]]; then
            tar -zxvf ${pkg_name}
            cd ${pkg_name%.tar*}
        fi
        
        ${py_bin} setup.py install
        cd -
    fi
}

main(){

#make_install /data/Python-2.7.13.tgz
}

#
#configure: error: no acceptable C compiler found in $PATH
#solve method:yum install gcc