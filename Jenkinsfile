node {
  stage('SCM') {
    git 'https://github.com/pushpkantpatil/sampleproject.git'
  }
  stage('SonarQube analysis') {
    def scannerHome = tool 'SonarScanner 4.8.0.2856';
    withSonarQubeEnv('mysonarqube') { // If you have configured more than one global server connection, you can specify its name
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
}
