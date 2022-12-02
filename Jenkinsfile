pipeline {
    agent {label 'slaveone'}
    stages {
        stage('my Build') {
            steps {
             dir ("/home/slaveone/new") {
                sh 'mkdir test'
             }
                sh "echo ${BUILD_VERSION}"
                sh 'mvn deploy'
            }
        }    
        stage( 'my deploy' ) {
        agent {label 'slavetwo'} 
            steps {
               sh 'curl -u rangalakshmirt@gmail.com:Admin@123 -O https://ranga.jfrog.io/artifactory/libs-release-local/com/efsavage/hello-world-war/${BUILD_VERSION}/hello-world-war-${BUILD_VERSION}.war'
               sh 'cp -R hello-world-war-${BUILD_VERSION}.war /opt/tomcat/webapps/' 
               sh 'sudo sh /opt/tomcat/bin/shutdown.sh'
               sh 'sleep 2'
               sh 'sudo sh /opt/tomcat/bin/startup.sh' 
            }
        }    
    } 
}
