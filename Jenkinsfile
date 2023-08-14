pipeline {
    agent any 
    environment {
    DOCKERHUB_ACCESS_KEY = credentials('DOCKERHUB_ACCESS_KEY')
    DOCKERHUB_USERNAME = credentials('DOCKERHUB_USERNAME')
    }
    stages { 
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/AkhilManoj03/JenkinsAutomateDockerBuild'
            }
        }
        stage('Build docker image') {
            steps {  
                sh '/opt/homebrew/bin/docker build -t $DOCKERHUB_USERNAME/flaskapp:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_ACCESS_KEY | /opt/homebrew/bin/docker login -u $DOCKERHUB_USERNAME --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh '/opt/homebrew/bin/docker push $DOCKERHUB_USERNAME/flaskapp:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh '/opt/homebrew/bin/docker logout'
        }
    }
}