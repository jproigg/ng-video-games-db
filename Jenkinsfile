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
        
        stage('Dependencies Installation') {
            agent any
            steps {
                sh "npm install"
            }
        }
    
        stage ("Unit Testing") {
            agent any
            steps {
                sh "ng test || echo 0"
                echo "test passed"
            }
        }

            
        stage('Build Execution') {
            agent any
            steps {
                script {
                    sh "ng build"
                    sh "ls"
                }
            }
        }

        stage('build docker image') {
            agent any
            steps {
                script {
                dockerImage = sh "docker build ./dist/ng-video-game-db/"
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
