#!/bin/bash
#Time:2017-06-06
#Author:Jenner.Luo

PWD=$(pwd)

download_python(){
    local py_url=$1
    if [[ -z ${py_url} ]]; then
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
    if [[ ! -z ${pkg_path} ]]; then
        local pkg_dir=${pkg_path%/*}
        local pkg_name=${pkg_path##/*}
        cd ${pkg_dir}
        tar -zxvf ${pkg_name}
    fi
}