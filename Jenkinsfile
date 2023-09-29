pipeline {
    agent any
    stages {
        stage('welcome') {
            steps {
                sh '''
                echo "hi there - welcome to the pipeline via webhook!"
                '''
            }
        }

        stage('build docker image') {
            steps {
                sh '''
                docker build -t maxmcf13/maxflask:latest .
                docker build -t maxmcf13/maxflask:${BUILD_NUMBER} .
                '''
            }
        }

        stage('run my app') {
            steps {
                sh '''
                ssh -i "~/.ssh/id_rsa" jenkins@10.154.0.28 << EOF
                docker pull maxmcf13/maxflask
                docker stop max-app && (docker rm max-app) || (docker rm max-app && sleep 1 || sleep 1)
                docker run -d -p 80:8081 --name max-app maxmcf13/maxflask
                '''
            }
        }

        stage('execute tests') {
            steps {
                sh '''
                python3 lbg.test.py
                '''
            }
        }
    }
}