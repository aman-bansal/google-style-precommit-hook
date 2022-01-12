#!/usr/bin/env sh
mkdir -p .cache
cd .cache
if [ ! -f google-java-format-1.13.0-all-deps.jar ]
then
    curl -LJO "https://github.com/google/google-java-format/releases/download/v1.13.0/google-java-format-1.13.0-all-deps.jar"
    chmod 755 google-java-format-1.13.0-all-deps.jar
fi
cd ..


all_files=$( find . -type f -path "./src/*/*" -name "*.java" )
echo $all_files
java -jar .cache/google-java-format-1.13.0-all-deps.jar -i $all_files
