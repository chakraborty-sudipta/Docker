pipeline {
    agent any  // This specifies that the pipeline can run on any available agent

    environment {
        DOCKER_IMAGE = "myapp:${env.BUILD_ID}"  // Set your Docker image name
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from version control (e.g., Git)
                git url: 'https://github.com/your-repo.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Run tests inside the Docker container
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'echo "Running tests..."'
                        // Replace this with your actual test commands
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Run the Docker container
                    docker.image(DOCKER_IMAGE).run('-d -p 8080:80')
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
