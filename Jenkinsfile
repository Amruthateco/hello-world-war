pipeline {
  agent {label 'slaveone'}
  stages {
    stage ('my build') {
      steps {
        sh "echo ${BUILD_VERSION}"
        sh "docker build -t mytomcat ."
      }
    }
    stage ('publish stage') {
      steps {
        sh "echo ${BUILD_VERSION}"
        sh 'docker login -u rangalakshmi123 -p xxxxxx'
        sh 'docker tag mytomcat rangalakshmi123/jenkins:${BUILD_VERSION}'
        sh 'docker push rangalakshmi123/jenkins:${BUILD_VERSION}'
      }
    }
    stage ('my deploy') {
      agent {label 'slavetwo'}
      steps {
        sh 'docker pull rangalakshmi123/jenkins:${BUILD_VERSION}'
        sh 'docker rm -f mytomcat'
        sh 'docker run -d -p 8085:8080 --name abc rangalakshmi123/jenkins:${BUILD_VERSION}'
      }
    } 
  }
}
