pipeline {
    agent { docker { image 'docker.io/brody/openjdk17-alpine' } }
    tools {
        maven 'maven-3.9'
    }
    stages {
        stage('Build Jar') {
            steps {
                echo "Building the application..."
                sh 'mvn package'
            }
        }
    }
    
    post {
        success {
            echo "Success! The pipeline has completed successfully."
            // You can add further actions or notifications on success here
        }
        failure {
            echo "Pipeline failed. Please investigate and take necessary actions."
            // You can add further actions or notifications on failure here
        }
    }
}
