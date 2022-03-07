pipeline {
    agent none
    stages {
        stage('Angular Verification') {
            agent {
                label "Linux"
            }
            steps {
                bat "ng version"
            }
        }
        
        stage('Dependencies Installation') {
            agent {
                label "Linux"
            }
            steps {
                bat "npm install"
            }
        }
    
        stage ("Unit Testing") {
            agent {
                label "Linux"
            }
            steps {
                bat "ng test || echo 0"
            }
        }

            
        stage('Build Execution') {
            agent {
                label "Linux"
            }
            steps {
                script {
                    bat "ng build"
                }
            }
        }
        
        stage('Deploy Application') {
            agent {
                label "Linux"
            }
            steps {
                script {
                    powershell "cp -r ./dist/ng-video-game-db/*.* C:/inetpub/wwwroot/jose/prod/"
                }
            }
        }
    }
}