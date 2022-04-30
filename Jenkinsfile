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

                          sh "docker build -t image1 ." //modify that
                          sh "docker run -privileged --name app-container -d -p 8091:80 image1"
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