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
                    // sh "docker build . -t test111"
                    //docker compose..
                    sh "docker build -t frontend-image ."
                    sh "docker rm -f frontend-container"
                    sh "docker run --name frontend-container -d -p 8091:80 frontend-image"
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