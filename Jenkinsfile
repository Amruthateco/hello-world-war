pipeline {
    agent {label 'slaveone'}
    stages {
        stage('my Build') {
            steps {
                sh "echo ${BUILD_VERSION}"
                sh 'docker build -t tomcat_build:${BUILD_VERSION} --build-arg BUILD_VERSION=${BUILD_VERSION} .'
            }
        }  
        stage('publish stage') {
            steps {
                sh "echo ${BUILD_VERSION}"
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'DockerhubPassword', usernameVariable: 'DockerhubUser')]) {
                sh "docker login -u ${env.DockerhubUser} -p ${env.DockerhubPassword}"
                sh 'docker tag tomcat_build:${BUILD_VERSION} rangalakshmi123/jenkins:${BUILD_VERSION}'
                sh 'docker push rangalakshmi123/jenkins:${BUILD_VERSION}'
                }
            }
        } 
        stage( 'my deploy' ) {
        agent {label 'slavetwo'} 
            steps {
               sh 'docker pull rangalakshmi123/jenkinss:${BUILD_VERSION}'
               sh 'docker rm -f mytomcat'
               sh 'docker run -d -p 8080:8080 --name mytomcat rangalakshmi123/jenkins:${BUILD_VERSION}'
            }
        }    
    } 
}
