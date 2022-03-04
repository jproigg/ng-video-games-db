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
                label "windows-worker"
            }
            steps {
                withSonarQubeEnv(installationName: "sonar-jose") {
                    powershell "./mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:4.7.0.2747:sonar"
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