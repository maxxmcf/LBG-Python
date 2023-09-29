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
                docker build -t maxflask:latest .
                docker build -t maxflask:{BUILD_NUMBER} .
                '''
            }
        }
    }
}