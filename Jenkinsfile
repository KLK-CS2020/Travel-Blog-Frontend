pipeline{
    agent any

     triggers {
        pollSCM("* * * * *")
      }


     stages{
              stage("build"){
                steps{
                    sh "npm run build"
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
                 sh "echo 'some tests'"
              }

              stage("deliver"){
                      sh "echo 'some delivery'"
              }
     }
}