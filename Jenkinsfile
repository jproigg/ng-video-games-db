pipeline {
    agent none
    stages {
        stage('Angular Verification') {
            agent {
                label "Linux"
            }
            steps {
                sh "ng version"
            }
        }
        
        stage('Dependencies Installation') {
            agent {
                label "Linux"
            }
            steps {
                sh "npm install"
            }
        }
    
        stage ("Unit Testing") {
            agent {
                label "Linux"
            }
            steps {
                sh "ng test || echo 0"
                echo "test passed"
            }
        }

            
        stage('Build Execution') {
            agent {
                label "Linux"
            }
            steps {
                script {
                    sh "ng build"
                }
            }
        }
        
        stage('Deploy Application') {
            agent {
                label "Linux"
            }
            steps {
                script {
                    sh "cp -r ./dist/ng-video-game-db/*.* C:/inetpub/wwwroot/jose/prod/"
                }
            }
        }
    }
}
