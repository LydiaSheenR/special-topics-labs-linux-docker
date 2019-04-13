#! /bin/bash


if [[ $# -eq 0 ]] ; then
    echo 'Please supply atleast one argument'
    exit 1
fi

echo $1 are not $2

if [[ $# -eq 1 ]] ; then
    option="${1}"
        case ${option} in
           -h) FILE="${2}"
              echo "help for shell script"
              exit 0
              ;;
           -d) DIR="/tmp/gitlab-data"
              echo "Dir name is $DIR"
              ;;
           -p) PORT= '30080'
              echo "Port GitLab listens on $PORT"
              ;;
           -start)
              echo "Starting gitlab in docker"
              docker-compose up -d
              ;;
           -stop)
              echo "Stopping Gitlab in docker"
              docker-compose up -d
              ;;
           -destroy)
              echo "Stopping Gitlab and removing docker containers"
              docker-compose up -d
              ;;
           *)
              echo "test"
              exit 1 # Command to come out of the program with status 1
              ;;
        esac

else
    option="${2}"
        case ${option} in
           -h)
              echo "help for shell script"
              exit 0
              ;;
           -d) DIR="/tmp/gitlab-data"
              echo "Dir name is $DIR"
              ;;
           -p) PORT= "30080"
              echo "Port GitLab listens on $PORT"
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
              echo "test"
              exit 1 # Command to come out of the program with status 1
              ;;
        esac
   exit 1
fi



#docker-compose up -d