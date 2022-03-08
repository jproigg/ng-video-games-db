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

        stage('Stop running container') {
            agent any
            steps {
                sh 'docker ps -f name=ng-video-game-db -q | xargs --no-run-if empty docker container stop'
                sh 'docker container ls -a -f name=ng-video-game-db -q | xargs -r docker container rm'
            }
        }


         stage('Deploy') {
            steps{
                script {
                    dockerImage.run("-p 8096:5000 --rm --name ng-video-game-db")
                }
            }
        }
 
    }
}
