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


                     /*  sh "docker rm -f weather-api-container"
                      sh "docker run --name weather-web-container -d -p 8091:80 weather-api" */
                    }

                     sh "docker build -t weather-api ."
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
                    sh "echo 'some tests'" // to add later
                }
              }

              stage("deliver"){
                steps{
                    sh "echo 'some delivery'"
                }
              }
     }
}