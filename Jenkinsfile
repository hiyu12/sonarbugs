pipeline {
    agent any
    stages {
        stage('SCM') {
            steps {
                git credentialsId: 'git-login', url: 'https://github.com/hiyu12/sonarbugs.git'
            }
        }
        stage('Sonar Analysis') {
            steps {
                script {
                    def scannerHome = tool 'sonar';
                    withSonarQubeEnv('sona') {
                        sh "${scannerHome}/bin/sonar-scanner\
                        -D sonar.projectKey=nodepro11"
                        sh "dotnet build -c Release"
                    }
                }
            }
        }
        stage('QualityGate'){
            steps {
                timeout(time: 1, unit: 'HOURS'){
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
