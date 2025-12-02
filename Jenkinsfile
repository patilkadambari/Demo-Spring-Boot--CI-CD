pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "your-dockerhub-username/Demo-Demo"
    }

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/YOUR_GITHUB_USERNAME/Demo-Demo.git'
            }
        }

        stage("Build with Maven") {
            steps {
                sh "mvn clean package -DskipTests"
            }
        }

        stage("Build Docker Image") {
            steps {
                sh "docker build -t $DOCKER_IMAGE:$BUILD_NUMBER ."
            }
        }

        stage("Push to Docker Hub") {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-token', variable: 'TOKEN')]) {
                    sh "echo $TOKEN | docker login -u your-dockerhub-username --password-stdin"
                }
                sh "docker push $DOCKER_IMAGE:$BUILD_NUMBER"
            }
        }

        stage("Deploy to Kubernetes") {
            steps {
                sh "sed -i 's#IMAGE_TAG#$BUILD_NUMBER#g' k8s/deployment.yaml"
                sh "kubectl apply -f k8s/"
            }
        }
    }
}
