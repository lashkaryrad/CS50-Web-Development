#! /bin/sh

# touch 'ed' files
echo "34i
    'home',
.
w
q" > /tmp/settings.ed

echo "18i
from django.urls import path, include
.
w
q" > /tmp/core-urls-1.ed

echo "22i
    path('', include('home.urls'))
.
w
q" > /tmp/core-urls-2.ed

echo "0i
from django.urls import path 
from . import views
# Create your models here.

urlpatterns = [
    path('', views.index, name='index'),
]
.
w
q" > /tmp/home-urls.ed

echo "4i
def index(request):
    return render(request, 'home/index.html')
.
w
q" > /tmp/views.ed

echo "0i
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
</head>
<body>
    {% block body %}

    {% endblock %}
</body>
</html>
.
w
q" > /tmp/layout-html.ed

echo "0i
{% block body %}

  <h1>Hello , world!</h1>

{% endblock %}
.
w
q" > /tmp/index-html.ed

# Make a requirements file

echo "asgiref
Django
sqlparse" > /tmp/requirements.txt    

# connect to virtual enviroment.
venv=$( ls -a )
for i in $venv;
do
    
    if [[ "env/" != *"$i"* ]];
    then 
        $( python3 -m venv env )
        source ./env/bin/activate
    else
        source ./env/bin/activate
    fi

done

# install requirements.
pip install -r /tmp/requirements.txt
rm -rf tmp/requirements.txt

# make the peoject.
django-admin startproject core 

# make the home project.
cd core/
python manage.py startapp home

# Add the 'home' app to settings.py
ed ./core/settings.py < /tmp/settings.ed

# inclue the 'home/urls.py'.
sed -i '' '/from\ django.urls\ import\ path/d' ./core/urls.py
ed ./core/urls.py < /tmp/core-urls-1.ed
ed ./core/urls.py < /tmp/core-urls-2.ed

# touch 'home/urls.py'.
touch ./home/urls.py
ed ./home/urls.py < /tmp/home-urls.ed

# add index functon to views.
echo " " >> ./home/views.py
ed ./home/views.py < /tmp/views.ed

# make templates DIR.
cd home/
mkdir -p templates
mkdir -p templates/home

# make the laouyt.html & index.html
cd templates/home/
touch layout.html index.html 

ed ./layout.html < /tmp/layout-html.ed
ed ./index.html < /tmp/index-html.ed

# rm '.ed' files (Clean UP)
rm -rf /tmp/*.ed

# Colors.
BGreen='\033[1;32m' # source: https://stackoverflow.com/a/28938235
NC='\033[0m' 

# last message
printf "\nthe Project 'core' ${BGreen}successfully${NC} Created.\n";
