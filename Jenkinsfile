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
    
        stage('Unit Test Execution') {
            steps {
                bat "ng test"
            }
        }
            stage('Build Execution') {
            steps {
                bat "ng build"
            }
        }
        
        stage('Deploy Application') {
            steps {
                bat "xcopy dist\\clase6 C:\\inetpub\\wwwroot\\jose\\main /s /y"
            }
        }
    }
}