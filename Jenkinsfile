pipeline {
    agent any
    stages {
        stage('code copy') {
            steps {
                 git url: 'https://github.com/Naresh100893/website-intelli.git', branch: 'master'
            }
        }
        stage('code-copy') {
            steps {
                sh  'docker kill $(docker ps -q)'
                sh  'docker build . -t naresh100893/intelli-image'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker run -itd -p 8090:80 naresh100893/intelli-image'
            }
        }
    }
}
