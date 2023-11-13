pipeline {
    agent any
    environment {
        image_name = "intelli-image"
        tag = "v2"
    }
    
   

    stages {
        stage('pre-checks') {
            parallel {
        stage('Hello') {
            steps {
                retry (3) {
                    sh 'echo "helo-world"'
                }
            
          
            }
        }

        stage('docker-verify') {
            steps {
                sh 'docker --version'
            }
        }
        }
        }
        stage('docker-build') {
            steps {
                git url: 'https://github.com/Naresh100893/website-intelli.git', branch: 'master'
                sh "docker build . -t ${image_name}:${env.BUILD_NUMBER}"
            }
        }
