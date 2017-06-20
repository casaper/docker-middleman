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
- run `./run.sh start`
- run `./run.sh build` to get the deployable html site in `./project/build/`
- see more options for run by executing `./run.sh`

view your local test site at [http://127.0.0.1:4567](http://127.0.0.1:4567)
