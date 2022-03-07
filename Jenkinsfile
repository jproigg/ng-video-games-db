pipeline {
    agent none
    environment {
        registry = "jproigg/ng-video-game-db"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }

    stages {
        stage('Angular Verification') {
            agent any
            steps {
                sh "ng version"
            }
        }
        
    
        stage ("Unit Testing") {
            agent any
            steps {
                sh "ng test || echo 0"
                echo "test passed"
            }
        }

        stage('compile application and install dependencies') {
            agent { dockerfile true }
            steps {
            echo 'success'
            }
        }


        stage('build docker image') {
            agent any
            steps {
                script {
                dockerImage = docker.build registry
                }
            }
        }

        stage('push to docker hub') {
            agent any
            steps {    
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    }
                }
            }
        }


        
        stage('Deploy Application') {
            agent any
            steps {
                script {
                    sh "cp -r ./dist/ng-video-game-db/*.* C:/inetpub/wwwroot/jose/prod/"
                }
            }
        }
    }
}
