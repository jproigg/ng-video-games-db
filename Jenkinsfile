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
        stage('Lint Test Execution') {
            steps {
                bat "ng lint"
            }
        }
        stage('Unit Test Execution') {
            steps {
                bat "ng test"
            }
        }
    }
}