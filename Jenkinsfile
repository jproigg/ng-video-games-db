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
                
                bat "ng build"
                powershell "ls"
            }
        }
        
        stage('Deploy Application') {
            steps {
                bat "xcopy dist\\clase6 C:\\inetpub\\wwwroot\\jose\\main /s /y"
            }
        }
    }
}