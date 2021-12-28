pipeline {
    agent {
        label 'linux'
    }
    parameters {
        choice(choices: ['test', 'prod'], description: 'Environment to deploy', name: 'ENVIRONMENT')
    }
    stages {
        stage('Setup workspace') {
            steps {
                checkout scm
                sh 'env'
            }
        }
        stage('Build') {
            when { not { allOf {
                buildingTag()
                expression { return sh([returnStatus: true, script: "make check-image-exists VERSION=${env.BRANCH_NAME}"]) == 0 }
            }}}
            steps {
                sh "make jenkins-build VERSION=${env.BRANCH_NAME}"
            }
        }
        stage('Push') {
            when { not { allOf {
                buildingTag()
                expression { return sh([returnStatus: true, script: "make check-image-exists VERSION=${env.BRANCH_NAME}"]) == 0 }
            }}}
            steps {
                sh "make push VERSION=${env.BRANCH_NAME}"
            }
        }
        stage('Deploy') {
            environment {
                ENVIRONMENT = "${params.ENVIRONMENT}"
            }
            steps {
                sh "make deploy-to-ecs VERSION=${env.BRANCH_NAME}"
            }
        }
    }
    post {
        success {
            office365ConnectorSend message: "Deployment environment: ${params.ENVIRONMENT}", status: "SUCCESS", webhookUrl: 'https://outlook.office.com/webhook/a33740ae-7b5d-4a0f-998b-5b7240a666df@ae967468-f01f-4b87-9a4c-06a356a2aa38/JenkinsCI/bd685a8a344545ad9a001ecc94988174/7188a613-c8e8-4478-bd4b-79dd59ece76c'
        }
        failure {
            office365ConnectorSend message: "Deployment environment: ${params.ENVIRONMENT}", status: "FAILURE", webhookUrl: 'https://outlook.office.com/webhook/a33740ae-7b5d-4a0f-998b-5b7240a666df@ae967468-f01f-4b87-9a4c-06a356a2aa38/JenkinsCI/bd685a8a344545ad9a001ecc94988174/7188a613-c8e8-4478-bd4b-79dd59ece76c', color:"d00000"
        }
    }
}