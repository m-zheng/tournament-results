# About

This project is a part of Full Stack Developer Nanodegree from [Udacity](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004).

It has a Python module that uses the PostgreSQL database to keep track of players and matches in a swiss-style game tournament. It also creates a database schema to store the game matches between players. A Python module is used to rank the players and pair them up in matches in a tournament.

## Getting Started

  - Install [Python 2.7](https://www.python.org/downloads).
  - Install [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/).
  - Clone this repository to your local machine:
    ```
    git clone https://github.com/minghua1991/tournament-results.git
    ```
  - Go to the directory that contains all code of this repository:
    ```
    cd tournament-results
    ```
  - Set up VM:
    ```
    vagrant up
    ```
  - Login to the virtual machine via SSH:
    ```
    vagrant ssh
    ```
  - Go to tournament directory:
    ```
    cd /vagrant/vagrant/tournament
    ```
  - Initialize the database:
    ```
    psql
    \i tournament.sql
    \q
    ```
  - Run the unit test:
    ```
    python tournament_test.py
    ```


License
----

MIT
