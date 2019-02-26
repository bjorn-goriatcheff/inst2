tar xf dep.tar.xz
tar xf pip.tar.xz
tar xf lib.tar.xz
tar xf Python-3.4.0.tar.xz
#GCC Make etc..
rpm -Uvh ./dep/*.rpm
./Python-3.4.0/configure --enable-optimizations
make
make install
/usr/local/bin/python3.4 -V

#Pip install
rpm -Uvh python2-pip-8.1.2-7.e17.noarch.rpm

#venv install and activation
/usr/local/lib/pip3.4 install --no-index --find-links=./pip-modules/ ./pip-modules/virtualenv-16.4.1-py2.py3-none-any.whl
/usr/local/python3.4 -m virtualenv vec_ai_env
source ./vec_ai_env/bin/activate

#Pip modules install
/usr/local/bin/pip3.4 install --no-index --find-links=./pip-modules/ ./pip-modules/statistics-1.0.3.5.tar.gz
/usr/local/bin/pip3.4 install --no-index --find-links=./pip-modules/ ./pip-modules/StringDist-1.0.9.tar.gz

#install libraries unsing pip
/usr/bin/pip install --no-index --find-links=./lib-req/ ./lib-req/pytz-2018.9-py2.py3-none-any.whl
/usr/bin/pip install --no-index --find-links=./lib-req/ ./lib-req/six-1.12.0-py2.py3-none-any.whl
/usr/bin/pip install --no-index --find-links=./lib-req/ ./lib-req/pandas-0.24.1-cp27-cp27mu-manylinux1_x86_64.whl
/usr/bin/pip install --no-index --find-links=./lib-req/ ./lib-req/numpy-1.16.1-cp27-cp27mu-manylinux1_x86_64.whl
/usr/bin/pip install --no-index --find-links=./lib-req/ ./lib-req/Pillow-5.4.1-cp27-cp27mu-manylinux1_x86_64.whl


