pipeline {
    agent any
    
    environment {
        image_name = "nov-image"
    }
    
    options {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '1'))
        disableConcurrentBuilds()
    }
    
    
    stages{
        stage('parallelcheck'){
        parallel {
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
        }
    }
        
        stage('dockerverify'){
            steps{
                sh 'echo "dockerverify"'
                sh  'docker --version'
            }
        }
        
        
        stage('dockerbuild'){
            when {

           expression {     

                  return env.GIT_BRANCH == "origin/master"   

                               }

       }
            steps{
                sh 'echo "dockerbuild"'
                sh "docker build . -t ${image_name}:${env.BUILD_NUMBER}"
            }
        }
        
        stage ('dockerdeploy'){
            input

{

message "Do you want to proceed for deployment ?"

}
            steps{
                sh 'echo "dockerdeploy"'
                sh 'docker kill $(docker ps -q)'
                sh "docker run -itd -p 8001:80 ${image_name}:${env.BUILD_NUMBER}"
            }
            }
        }
    }
