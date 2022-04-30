pipeline{
    agent any

     triggers {
        pollSCM("* * * * *")
      }


     stages{
              stage("build"){
                steps{
                    dir("gym-one-fr") {
                        sh "npm run build"
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