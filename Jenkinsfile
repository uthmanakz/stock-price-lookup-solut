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
            yes "yes" | terraform init
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

        stage ('Downlaodig Ansible/dependices') {
            steps {
                script {
                    sshagent(credentials : ['SSH_PRIVATE_KEY']) {
                        sh'''
                        ANSIBLE=$(terraform output | grep ANSIBLE | awk -F'"' '{print $2}')
                        ssh -o StrictHostKeyChecking=no ec2-user@$ANSIBLE 'sudo yum install python3-pip -y; pip3 install ansible ; pip3 install boto3' 
                        '''
                    }
                }
            }
        }
    }
}