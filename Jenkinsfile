pipeline {
	environment {
		imagename = "docker-playground"
		registryCredential = 'docker-hub-user'
		githubCredentials = 'github-user'
	}
    agent {
        node {
            label 'ubuntu-203'
        }
    }
    stages {
        stage('Cloning git') {
            steps {
                git([url: 'https://github.com/ZeroExistence/jenkins-docker-playground.git', branch: 'master', credentialsId:github])
            }
        }
        stage('Build Image') {
            steps {
                script {
					dockerImage = docker.build imagename
				}
            }
        }
        stage('Deploy Image') {
			steps {
				script {
					docker.withRegistry('', registryCredential) {
						dockerImage.push("$BUILD_NUMBER")
						dockerImage.push("latest")
					}
				}
			}
		}
    }
    post {
        success {
            echo 'success'
        }
        failure {
            echo 'failed'
        }
    }
}
