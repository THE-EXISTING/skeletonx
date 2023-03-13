#!/bin/sh
# Run sudo chmod 755 restart_pub_get.sh before use.

echo "Flutter Clean Recursive (by jeroen-meijer on GitHub Gist)"
echo "Looking for projects... (may take a while)"

# shellcheck disable=SC2016
find .. -name "pubspec.yaml" -exec $SHELL -c '
    echo "#------- Start cleaning and get all projects. -------#"
    for i in "$@" ; do
        DIR=$(dirname "${i}")
        echo "flutter clean ${DIR}..."
        (cd "$DIR" && flutter clean >/dev/null 2>&1)
        echo "flutter pub get ${DIR}..."
        (cd "$DIR" && flutter pub get >/dev/null 2>&1)
        echo "flutter packages get ${DIR}..."
        (cd "$DIR" && flutter packages get >/dev/null 2>&1)
        echo "--------------------"
    done
    echo "DONE!"
' {} +