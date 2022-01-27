#!/usr/bin/env bash
checkVersion() {
    echo "Version = $1"
	echo $1 |grep -E "^[0-9]+\.[0-9]+\.[0-9]+" > /dev/null
    if [ $? = 0 ]; then
        return 1
    fi

	echo "Version $1 illegal, it should be X.X.X format(e.g. 4.5.0), please check released versions in 'https://archive.apache.org/dist/rocketmq/'"
    exit -1
}

if [ $# -lt 1 ]; then
    echo -e "Usage: sh $0 Version"
    exit -1
fi

VERSION=$1

checkVersion $VERSION

docker build --no-cache -f Dockerfile -t martindai/cerebro:${VERSION} --build-arg version=${VERSION} .

