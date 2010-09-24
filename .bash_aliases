.. () {
    cd ..
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

pmr() {
    python manage.py runserver
}

pms() {
    python manage.py shell
}

pmt() {
    python manage.py test $1
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
