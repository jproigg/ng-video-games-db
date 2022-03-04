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
    
        stage('Docker verification') {
            steps {
                script {
                    powershell "Install-PackageProvider -Name Nuget -Force"
                    powershell "Install-Module -Name DockerMsftProvider -Repository PSGallery -Force"
                    powershell "Install-Package -Name docker -ProviderName DockerMsftProvider"
                    powershell "docker ps"
                }
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
                script {
                    powershell "cp -r ./dist/ng-video-game-db  /*.* C:/inetpub/wwwroot/jose/prod/"
                    powershell "cd C:/inetpub/wwwroot/jose/prod/; ls"
                }
            }
        }
    }
}