pipeline{
    agent any

     triggers {
        pollSCM("* * * * *")
      }


     stages{
              stage("build"){
                steps{
                    dir("hello-world") {
                        sh "npm -g install"
                        sh "npm i @vue/cli-service"
                        sh "npm run build "
                    }

                    //docker compose..
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
                    sh "echo 'some tests'"
                }
              }

              stage("deliver"){
                steps{
                    sh "echo 'some delivery'"
                }
              }
     }
}