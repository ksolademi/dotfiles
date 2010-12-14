.. () {
    cd ..
}

alias git="git-achievements"

starteclim(){
    ~/opt/eclipse/eclimd
}

b() {
    cd -
}

ll() {
    ls -lah
}

llt() {
    ls -lath
}

eba() {
    vim ~/.bash_aliases
}

wee(){
    workon ee
}

pmr() {
    python manage.py runserver
}

pms() {
    python manage.py shell
}

pmy() {
    python manage.py syncdb
}

pmt() {
    python manage.py test $1
}

djt() {
    cd ..
    svn up
    cd -
    rm analyzer/nettrekker/proseclassifier/svm.py*
    ./manage.py test --settings=test_settings $1
}

src(){
    source ~/.bashrc
}

recreate(){
    mysql -u root -pr00t -e "drop database $1"
    mysql -u root -pr00t -e "create database $1"
}

destroy(){
    mysql -u root -pr00t -e "drop database $1"
}

sync-test(){
    ./manage.py syncdb --settings=test_settings --noinput
}

migrate-test(){
    ./manage.py migrate --all --settings=test_settings
}

dj-init-ramdisk(){
    echo "It's good to run me after system restarts."
    echo "When mysql isn't attached to a ramdisk"
    echo "that may or may not exist."
    echo "Also, it is good to run me in same dir as manage.py lives,"
    echo "and I need to know what database to recreate, sync, and "
    echo "migrate"
    ~/devel/mysql-ramdisk/mysql-ramdisk.py -c -m
    create-test $1
    workon ee
    sync-test
    migrate-test
}


dbshell-test(){
    ./manage.py dbshell --settings=test_settings
}

recreate-test(){
    mysql -u root --socket=/tmp/mysql.ramdisk.sock -e "drop database $1"
    mysql -u root --socket=/tmp/mysql.ramdisk.sock -e "create database $1"
}

destroy-test(){
    mysql -u root --socket=/tmp/mysql.ramdisk.sock -e "drop database $1"
}

create-test(){
    mysql -u root --socket=/tmp/mysql.ramdisk.sock -e "create database $1"
}

myhelp(){
    echo "Welcome to my aliases:"
    echo "ee: activate ee and go to its virtenv root directory"
    echo "eed: activate ee venv & goto dirty"
    echo "eec: activate ee venv & goto clean"
    echo "ees: start apache solr"
    echo "pmt: python manage.py test"
    echo "ll: ls -lah"
    echo "llt: ls -lath"
    echo "eba: vim ~/.bash_aliases"
    echo "recreate <dbname>: drop and create a database <dbname>"
    echo "destroy <dbname>: drop a database of name <dbname>"
    echo "eessh"
    echo "pysearch: grep python files recursively"
}

cddevelvenv(){
    cd ~/devel/virtenv/
}

ee(){
    workon ee
    cddevelvenv
    cd ee
}

eed(){
    workon ee
    cddevelvenv
    cd ee/ee_dirty/engaging_english/web
}
eec(){
    workon ee
    cddevelvenv
    cd ee/ee_clean/engaging_english/web
}

# Start solr.
ees(){
    sudo mount -t tmpfs -o size=1M tmpfs /mnt/solr-ramdisk/
    workon ee
    cd ~/devel/tools/apache-solr-1.4.0/example
    java -jar start.jar
}

# Activate dirty env; goto dir; run svn up.
eedu(){
    eed
    cd ..
    svn up
    cd web
}


# Activate clean env; goto dir; run svn up.
eecu(){
    eed
    cd ..
    svn up
    cd web
}



gsvn(){
    grep -lr $1 * | grep -v ".svn"
}

#cd to the folder containing the python package or file you want
#from http://chris-lamb.co.uk/2010/04/22/locating-source-any-python-module/
cdp () {
  cd "$(python -c "import os.path as _, ${1}; \
      print _.dirname(_.realpath(${1}.__file__[:-1]))"
        )"
}

#Thanks paul!
eessh(){
    ssh kgrandis@$1.engagingenglish.com
}

pysearch() {
    grep -Ir --include=*.py $1 *
}

rmpyc() {
    find . -name "*.pyc" -delete
}
