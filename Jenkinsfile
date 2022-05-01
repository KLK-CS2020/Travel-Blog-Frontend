pipeline{
    agent any

     triggers {
        pollSCM("* * * * *")
      }


     stages{
           stage("build"){
                steps{
                    dir("hello-world") {
                        sh "npm install"
                        sh "npm i @vue/cli-service"
                        sh "npm run build "

                    }
                }
                post{
                    always {
                        sh "echo 'Building frontend finished'"
                    }
                    success {
                        sh "echo 'Building frontend succeeded'"
                    }
                    failure {
                        sh "echo 'Building frontend failed'"
                    }
                }
              }

              stage("test"){
                steps{
                    sh "echo 'some tests'" // to add later
                }
              }
              stage("Clean container"){
                steps{
                    script{
                        try{
                            sh "docker rm -f frontend-container"
                        }finally{ }

                    }

                }
              }

             stage("Deploy") {
                       steps{
                           sh "docker build -t frontend-image ."
                           sh "docker run --name frontend-container -d -p 8091:80 frontend-image"
                       }
                  post{
                            always {
                                sh "echo 'deploying frontend finished'"
                            }
                            success {
                                sh "echo 'deploying frontend succeeded'"
                            }
                            failure {
                                sh "echo 'deploying frontend failed'"
                            }
                     }
             }
     }
}