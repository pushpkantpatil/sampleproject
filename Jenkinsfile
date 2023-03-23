pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                def scannerHome = tool 'mysonarscanner'
                withSonarQubeEnv('mysonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }
}
