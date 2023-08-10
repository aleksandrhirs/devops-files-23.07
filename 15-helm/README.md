# Домашнее задание 13

- В репозитории с домашними заданиями создайте каталог `12-helm`
- Создайте свой чарт для установки word-cloud-generator (Дз 12)
- Порты, версия докер образа, имя хоста в ingress должны задаваться через values.

&nbsp;
- Ответьте на [вопросы](https://forms.gle/S6K4p8kXrscevXD88)

# Полезные ссылки

- [Документация Helm](https://helm.sh/)

# Команды helm

- `helm repo add jenkins https://charts.jenkins.io`
- `helm repo list`
- `helm search repo jenkins`
- `helm install jenkins jenkins/jenkins --version 4.1.3`
- `helm upgrade jenkins jenkins/jenkins --version 4.3.20`
- `helm template demo`
- `helm upgrade demo demo --debug --dry-run`
- `helm history demo`
- `helm upgrade demo . --set image.tag=1.22 --debug`
- `helm status demo`
- `helm rollback demo`
- `helm rollback demo 2`
- `helm package demo`
- `helm create dummy`
- `helm show values jenkins/jenkins`
- `helm pull jenkins/jenkins --untar --version 3.12.2`
