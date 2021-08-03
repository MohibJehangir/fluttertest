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
        /*stage('Code Coverage') {
            steps {
                 sh """
                cd /var/lib/jenkins/workspace/Flutter_jenkinsfile
                flutter test --coverage
                genhtml coverage/lcov.info -o coverage/html
                """
            }
        }*/
        stage('Test') {
            steps {
					script {
                    try {
                        sh "rm -rf $WORKSPACE/flutter_jenkinsfile/coverage"	
						sh "cd $WORKSPACE/flutter_jenkinsfile && flutter test --coverage"
						sh "cd $WORKSPACE/flutter_jenkinsfile/coverage && ls -l"	
                    } catch (e) {
                        throw e
                    } 
					finally {
                        sh "cd $WORKSPACE/"
						sh "python3 lcov_cobertura.py $WORKSPACE/flutter_jenkinsfile/coverage/lcov.info --output $WORKSPACE/flutter_jenkinsfile/coverage/cobertura_coverage.xml"
						sh "cd $WORKSPACE/flutter_jenkinsfile/coverage/ && ls -l"
						sh "cd $WORKSPACE/flutter_jenkinsfile/coverage && cp cobertura_coverage.xml $WORKSPACE"
						sh "cd $WORKSPACE && ls -l"	
						step([$class: 'CoberturaPublisher', coberturaReportFile: 'cobertura_coverage.xml'])
                    }	
                }
				
            }
            
        } 
    }
    }
}
}

