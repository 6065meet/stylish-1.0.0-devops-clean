pipeline {
    agent any
    environment {
        IMAGE = '6065meet/stylish:${BUILD_NUMBER}'
    }
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/6065meet/stylish-1.0.0.devops.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'echo $PASSWORD | docker login -u $USERNAME --password-stdin'
                    sh 'docker push $IMAGE'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl set image deployment/stylish-deployment stylish=$IMAGE -n stylish-namespace'
            }
        }
    }
}
