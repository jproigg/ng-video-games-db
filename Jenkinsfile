pipeline {
    agent none
    stages {
        stage('Angular Verification') {
            agent {
                label "windows-worker"
            }
            steps {
                bat "ng version"
            }
        }
        
        stage('Dependencies Installation') {
            agent {
                label "windows-worker"
            }
            steps {
                bat "npm install"
            }
        }
    
        stage ("Sonarqube Docker") {
            agent {
                label "Linux"
            }
            steps {
                sh "docker ps"
            }
        }

        stage ("scan code with sonar") {
            agent {
                label "windows-worker"
            }
            steps {
                bat "npm install sonar-scanner --save-dev"
                withSonarQubeEnv("sonar-jose") {
                    powershell "sonar-scanner"
                }
            }
        }
            
        stage('Build Execution') {
            agent {
                label "windows-worker"
            }
            steps {
                script {
                    bat "ng build"
                }
            }
        }
        
        stage('Deploy Application') {
            agent {
                label "windows-worker"
            }
            steps {
                script {
                    powershell "cp -r ./dist/ng-video-game-db/*.* C:/inetpub/wwwroot/jose/prod/"
                }
            }
        }
    }
}