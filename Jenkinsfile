pipeline {
    agent any
    stages{
        stage('codecopy'){
            steps{
                sh 'echo "codecopy"'
                git url : 'https://github.com/kothapallisrikanth/website-intelli.git'
            }
        }
        
        stage('gitverify'){
            steps{
                sh 'echo "gitverify"'
                sh  'git --version'
            }
        }
        
        stage('dockerverify'){
            steps{
                sh 'echo "dockerverify"'
                sh  'docker --version'
            }
        }
        
        stage('dockerbuild'){
            steps{
                sh 'echo "dockerbuild"'
                sh 'docker build . -t srikanth370/new-image:latest'
            }
        }
        
        stage ('dockerdeploy'){
            steps{
                sh 'echo "dockerdeploy"'
                sh 'docker kill $(docker ps -q)'
                sh 'docker run -itd -p 8001:80 srikanth370/new-image:latest'
            }
            }
        }
    }
