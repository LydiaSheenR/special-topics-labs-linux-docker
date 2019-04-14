#! /bin/bash


if [[ $# -eq 0 ]] ; then
    echo 'Please supply atleast one argument'
    exit 1

else
    option="${1}"
        case ${option} in
           -h)
              echo "
                    -h      Help for gitlab-ctl shell script

                    -d      prints out the directory

                    -p      prints the port number that GitLab listens on

                    start   Starts Gitlab Redis and PostgreSQL in  docker containers

                    stop    Stops gitlab but does not remove the containers

                    destroy Stops gitlab and removes the container

              "
              exit 0
              ;;
           -d) DIR="/tmp/gitlab-data"
              echo "Dir name is $DIR"
              ;;
           -p)
              echo " GitLab listens on PORT 30080"
              ;;
           start)
              echo "Starting gitlab in docker"
              docker-compose up -d
              ;;
           stop)
              echo "Stopping Gitlab in docker"
              docker-compose stop -d
              ;;
           destroy)
              echo "Stopping Gitlab and removing docker containers"
              docker-compose down -d
              ;;
           *)
              echo "
    Please choose a valid option $option is not a valid argument

    Run the script again with -h to see all the valid arguments
"
              exit 1 # Command to come out of the program with status 1
              ;;
        esac
   exit 1
fi
