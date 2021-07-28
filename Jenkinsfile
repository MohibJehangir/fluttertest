pipeline {
    agent any

    stages {
        stage('GIT PULL') {
          
        }
        stage('TEST') {
            steps {
                sh 'flutter test'
            }
        }
        stage('BUILD') {
            steps {
                sh '''
                  #!/bin/sh
                  flutter build apk --debug
                  '''
            }
        }
        stage('DISTRIBUTE') {
            steps {
                appCenter apiToken: '481f20b0069c191ef9adfbf6b9e027f68a7cf10f',
                        ownerName: 'MohibJehangir',
                        appName: 'Test',
                        pathToApp: 'build/app/outputs/apk/debug/app-debug.apk',
                        distributionGroups: 'testgroup'
            }
        }
    }
}