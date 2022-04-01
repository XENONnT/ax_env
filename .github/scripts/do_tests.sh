# Copied from base env
#!/bin/bash

echo "Running tests"

# spool up test-database for tests
export TEST_MONGO_URI='mongodb://localhost:27017/'

echo " ..." $1 "tests"

case "$1" in
  strax )
    strax_version=`python -c "import strax; print(strax.__version__)"`
    git clone --single-branch --branch v$strax_version https://github.com/AxFoundation/strax.git
    pytest strax || { echo 'strax tests failed' ; exit 1; }
    rm -r strax
  ;;
  straxen )
    straxen_version=`python -c "import straxen; print(straxen.__version__)"`
    git clone --single-branch --branch v$straxen_version https://github.com/XENONnT/straxen.git
    bash straxen/.github/scripts/create_pre_apply_function.sh $HOME
    cd straxen
    python setup.py test || { echo 'straxen tests failed' ; exit 1; }
    cd ..
    rm -r straxen
    rm $HOME/pre_apply_function.py
  ;;
  wfsim )
    wfsim_version=`python -c "import wfsim; print(wfsim.__version__)"`
    echo "Testing $wfsim_version"
    git clone --single-branch --branch v$wfsim_version https://github.com/XENONnT/wfsim ./wfsim
    pytest wfsim || { echo 'wfsim tests failed' ; exit 1; }
    rm -r wfsim
  ;;
  pema )
    pema_version=`python -c "import pema; print(pema.__version__)"`
    echo "Testing $pema_version"
    git clone --single-branch --branch v$pema_version https://github.com/XENONnT/pema ./pema
    pytest pema || { echo 'pema tests failed' ; exit 1; }
    rm -r pema
  ;;
  reprox )
    reprox_version=`python -c "import reprox; print(reprox.__version__)"`
    echo "Testing $reprox_version"
    git clone --single-branch --branch v$reprox_version https://github.com/XENONnT/reprox ./reprox
    bash reprox/.github/scripts/overwrite_testing_file.sh test_folder test.ini
    export REPROX_CONFIG=/home/runner/work/ax_env/reprox/reprox/test_folder/test.ini
    pwd
    pytest reprox || { echo 'reprox tests failed' ; exit 1; }
    rm -r reprox
#  * )
#      echo "Usage: $0 {strax|straxen|wfsim|pema|reprox}"
#      exit 1
#  ;;
esac
