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
                sh "docker rm -f sonarqube"
                sh "docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube"
                sh "docker ps"
            }
        }

        stage ("scan code with sonar") {
            agent {
                label "Linux"
            }
            steps {
                sh "npm install"
                withSonarQubeEnv(installationName: "sonar-jose") {
                    sh "./npm run sonar-scanner"
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