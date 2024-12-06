pipeline {
    agent {
        label 'agent-1'
    }
    options {
        timeout(time: 30, unit: 'MINUTES')  // abort the build if not done in 30 min.
        disableConcurrentBuilds()
        ansiColor('xterm')                  // plugin
    }
    environment{
        def appVersion = ''          // declare global variable to use it in multiple stages
    }
    stages {
        stage('read version'){       // reading version from package.json
            steps {
                script{               // we can write in script or use trple qoutes ''' <script>'''
                    def packageJson = readJSON file: 'package.json'   // readJSON is to read json files 
                    appVersion = packageJson.version                   //to store version in variable
                    echo "application version: $appVersion"
                }
                
            }
        }
        stage('install dependencies'){     // installing all dependencies and see files list with ls -l
            steps {
                sh """
                    npm install
                    ls -ltr                 
                    echo "application version: $appVersion"
                """

            }
        }
        stage('build artifact'){         // building artifact and -q is for quiet mode and -x is for exclusion
            steps {
                sh '''
                    zip -q -r backend-${appVersion}.zip * -x Jenkinsfile -x backend-${appVersion}.zip
                ls -ltr
                '''
            }
        }
    }
     post { 
        always { 
            echo 'I will always say Hello again!'
            deleteDir()             // deletes workspace once build is completed
        }
        success { 
            echo 'I will run when pipeline is success'
        }
        failure { 
            echo 'I will run when pipeline is failure'
        }
    }
}