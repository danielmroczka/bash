#!/bin/sh
read -p "Enter Groovy version to download and install: " version

url=http://dl.bintray.com/groovy/maven/groovy-binary-${version}.zip
read -p "Do you want download groovy binaries ${url} (y/n) "? resp

if [ "$resp" = 'y' ]; then
    wget $url
fi

prefix="/usr/lib/groovy/groovy-"$version;

if [[ ! -f groovy-binary-${version}.zip  ]]; then
    echo "File not found!"
    return -1	
fi

unzip groovy-binary-${version}.zip
sudo mv groovy-${version} /usr/lib/groovy 

echo $prefix
sudo update-alternatives --install "/usr/bin/groovy" "groovy" $prefix"/bin/groovy" 1
sudo update-alternatives --install "/usr/bin/groovyc" "groovyc" $prefix"/bin/groovyc" 1
sudo update-alternatives --install "/usr/bin/groovyConsole" "groovyConsole" $prefix"/bin/groovyConsole" 1
sudo update-alternatives --install "/usr/bin/groovysh" "groovysh" $prefix"/bin/groovysh" 1
sudo update-alternatives --install "/usr/bin/java2groovy" "java2groovy" $prefix"/bin/java2groovy" 1

sudo update-alternatives --config groovy

groovy -v

rm groovy-binary-${version}.zip


