pipeline {
    agent any

    stages {
        stage('Code Analysis'){
            steps{
                sh """
                cd /var/lib/jenkins/workspace/Flutter_jenkinsfile
                flutter analyze
                """
            }
        }
        stage('flutter Unit test') {
            steps {
                 sh """
                cd /var/lib/jenkins/workspace/Flutter_jenkinsfile
                flutter test
                """
            }
        }
        stage('Code Coverage') {
            steps {
                 sh """
                cd /var/lib/jenkins/workspace/Flutter_jenkinsfile
                flutter test --coverage
                genhtml coverage/lcov.info -o coverage/html
                """
            }
        }
    }
}

