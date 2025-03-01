pipeline {
    agent any 
    environment {
        AWS_ACCESS_KEY_ID = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage ('Terraform init') {
            steps {
            sh'''
            cd dev
            terraform init
            '''
            }
        }
        stage ('Terraform plan') {
            steps {
            sh'''
            cd dev
            terraform plan
            '''
            }
        }

        stage ('Terraform apply') {
            steps {
            sh'''
            cd dev
            terraform apply -auto-approve
            '''
            }
        }
    }
}