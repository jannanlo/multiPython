#!/bin/bash
#Time:2017-06-06
#Author:Jenner.Luo

PWD=$(pwd)

download_python(){
    local py_url=$1
    if [[ ! ${py_url} ]]; then
        py_url=https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
    fi
    local pkg_dir=${PWD}/softwares
    if [[ ! - ${pkg_dir} ]]; then
        mkdir ${pkg_dir}
    fi
    wget -P ${pkg_dir} ${py_url}

    echo ${PWD}/${py_url##*/}   # Return package path
}
