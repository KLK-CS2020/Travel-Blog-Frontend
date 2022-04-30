pipeline{
    agent any

     triggers {
        pollSCM("* * * * *")
      }


     stages{
            stage('Initialize'){
                    def dockerHome = tool 'myDocker'
                    env.PATH = "${dockerHome}/bin:${env.PATH}"
                }

              stage("build"){
                steps{
                    dir("hello-world") {
                        sh "npm install"
                        sh "npm i @vue/cli-service"
                        sh "npm run build "
                    }
                    //docker compose..
                      sh "docker build -t image1 ." //modify that
                      sh "docker run --name app-container -d -p 8091:80 image1"
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