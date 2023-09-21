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
                echo "Building the Podman image..."
                sh 'docker build -t java-lab-app:javamaven-3.9 .'
                sh 'docker images'
                sh 'whoami'
                }
            }
        

        stage('Deploy Application') {
            steps {
                echo "Deploying the application..."
                sh 'docker run -d --name java-lab-application --restart=on-failure -v java-application:/var/java-application:Z -p 8888:8080 localhost/java-lab-app:javamaven-3.9'
            }
        }
    }
    post {
        success {
            echo "Success! The pipeline has completed successfully."
            sh 'docker exec -it java-lab-application curl http://localhost:8080'
            // You can add further actions or notifications on success here
        }
        failure {
            echo "Pipeline failed. Please investigate and take necessary actions."
            // You can add further actions or notifications on failure here
        }
    }
}
