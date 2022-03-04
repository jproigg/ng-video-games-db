pipeline {
    agent any
    stages {
        stage('Angular Verification') {
            agent{
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
    

        stage('Docker verification') {
            agent any
            steps {
                sh "docker ps"
            }
        }
        
        stage('Build Execution') {
            agent {
                label "windows-worker"
            }
            steps {
                script {
                    bat "ng build"
                    powershell "ls dist" 
                }
            }
        }
        
        stage('Deploy Application') {
            agent {
                label "windows-worker"
            }
            steps {
                script {
                    powershell "cp -r ./dist/ng-video-game-db  /*.* C:/inetpub/wwwroot/jose/prod/"
                    powershell "cd C:/inetpub/wwwroot/jose/prod/; ls"
                }
            }
        }
    }
}