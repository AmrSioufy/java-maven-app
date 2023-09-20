pipeline {
    agent any
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
        stage('Build Podman Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'redhat registry', passwordVariable: 'PASS', usernameVariable: 'USER')])
                echo "Building the Podman image..."
                sh "echo $PASS | podman login -u $USER --password-stdin"
                sh 'sudo podman build -t lab-app:javamaven-3.9 .'
                sh 'sudo podman images'
                sh 'sudo whoami'
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
