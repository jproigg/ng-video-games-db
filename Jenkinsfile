pipeline {
    agent {
        label "windows-worker"
    }
    stages {
        stage('Angular Verification') {
            steps {
                bat "ng version"
            }
        }
        
        stage('Dependencies Installation') {
            steps {
                bat "npm install"
            }
        }
    
       /* stage("lint test") {
            steps {
                bat "ng lint"
            }
        }

        stage("unit test") {
            steps {
                bat "ng test"
            }
        }*/
        
        stage('Build Execution') {
            steps {
                script {
                    bat "ng build"
                    powershell "ls dist" 
                }
            }
        }
        
        stage('Deploy Application') {
            steps {
                script {
                    powershell "cp -r ./dist/ng-video-game-db  /*.* C:/inetpub/wwwroot/jose/prod/"
                }
            }
        }
    }
}