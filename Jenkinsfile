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
                bat "xcopy dist\\ng-video-game-db C:\\inetpub\\wwwroot\\jose\\main /s /y"
            }
        }
    }
}