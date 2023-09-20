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
                withCredentials([usernamePassword(credentialsId: 'redhat registry', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    echo "Building the Podman image..."
                    sh "echo $PASS | sudo podman login registry.redhat.io -u $USER --password-stdin"
                    sh 'sudo podman build -t java-lab-app:javamaven-3.9 .'
                    sh 'sudo podman images'
                    sh 'sudo whoami'
                }
            }
        }

        stage('Deploy Application') {
            steps {
                echo "Deploying the application..."
                sh 'sudo podman run -d --name java-lab-application --restart=on-failure -v java-application:/var/java-application:Z -p 8888:8080 localhost/java-lab-app:javamaven-3.9'
            }
        }
    }
    post {
        success {
            echo "Success! The pipeline has completed successfully."
            sh 'sudo podman exec -it java-lab-application curl http://localhost:8080'
            // You can add further actions or notifications on success here
        }
        failure {
            echo "Pipeline failed. Please investigate and take necessary actions."
            // You can add further actions or notifications on failure here
        }
    }
}
