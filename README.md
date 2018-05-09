# Pp :massage:
---

Pp application is communication platform like slack. With Pp you can instantly communicate in groups or individually. This project has used Ruby on Rails for the back-end, VueJs for the front-end and for the database PostgreSQL. And in this project, the rails's Action Cable structure was used to communicate instantly.

### Installiation
---
> for Linux
- we need to database. Install PostgreSQL last version with this command:
```shell
  $ sudo apt-get install postgresql-9.4 postgresql-client-9.4
```

- To check that the PostgreSQL server was correctly installed and is running, you can use the command ps:
```shell
$ ps -ef | grep postgre
```

- Now we can install **Pp** application. You can clone this repo with command:
```shell
$ git clone git@github.com:ebrugulec/Pp.git
```

- we need to install the gems required for this application:
```shell
$ cd Pp
$ bundle
```

- We must setup database:
```shell
$ rake db:create
$ rake db:seed
$ rake db:migrate
```

- Now, We can run application.
```shell
$ rails s
```
