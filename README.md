# Narcotics Anonymous Middleman

## Run Development Environment with docker

### Requirements

- [homebrew](https://brew.sh/)
- [Docker for Mac OS](https://docs.docker.com/docker-for-mac/install/)

### Setup process

#### Eventually working script

If you're on a Mac OS Computer you can try running the setup script `install_mac_dependencies.sh`.

```bash
$ cd to/a/directory/where/you/store/your/data
$ git clone git@github.com:casaper/docker-middleman.git
$ cd docker-middleman
$ ./install_mac_dependencies.sh
```

#### Step by step

- Install Git on your system, if it isn't
- Get [Docker](https://docs.docker.com/) installed on your system
- Clone this git repository to your computer
- run `docker-compose build` in you're terminal to get an automated build of the docker image needed
- run `docker-compose up` in you're terminal to get the fresh built image have it's first run setup
- after first run the docker VM can be stopped with `Ctrl+C`
- view your local test site at [http://127.0.0.1:4567](http://127.0.0.1:4567)

### Usage after Setup

- from now on you can just run `docker-compose start` to start the VM
- run `docker-compose stop` to get it down again

- `docker-compose ps` to see it's status
- `docker-compose logs middleman` to see its console output
- `docker-compose exec middleman bash` to get a shell in the VM
- in that shell run `bundle exec middleman build` in order to get a publishable build
- view your local test site at [http://127.0.0.1:4567](http://127.0.0.1:4567)
