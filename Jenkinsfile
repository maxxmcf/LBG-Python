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
        stage('execute tests') {
            steps {
                sh 'python lbg.test.py'
            }
        }
        stage('build docker image') {
            steps {
                sh '''
                docker build -t maxflask:latest .
                docker build -t maxflask:${BUILD_NUMBER} .
                '''
            }
        }
    }
}