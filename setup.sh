tar xf dep2.tar.xz
tar xf dep3.tar.xz
tar xf pip.tar.xz
tar xf lib.tar.xz

#GCC Make etc..
rpm -Uvh ./dep2/*.rpm
rpm -Uvh ./dep3/*.rpm

source /opt/rh/rh-python34/enable
echo python3 -V
which python3
#venv install and activation
python3 -m virtualenv vec_ai_env
source ./vec_ai_env/bin/activate

#numpy install
rpm -Uvh ./numpy-rpm/*.rpm
rpm -Uvh ./six-rpm/*.rpm

#Pip modules install
python3 -m pip install --no-index --find-links=./pip-modules/ ./pip-modules/statistics-1.0.3.5.tar.gz
python3 -m pip install --no-index --find-links=./pip-modules/ ./pip-modules/StringDist-1.0.9.tar.gz
python3 -m pip install --no-index --find-links=./pip-modules/ ./pip-modules/Pillow-5.4.1.tar.gz


