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

        stage ('Downlaodig Ansible/dependices') {
            steps {
                script {
                    sshagent(credentials : ['SSH_PRIVATE_KEY']) {
                        sh'''
                        cd dev
                        ANSIBLE=$(terraform output | grep ANSIBLE | awk -F'"' '{print $2}')
                        ssh -o StrictHostKeyChecking=no ec2-user@$ANSIBLE 'sudo yum install python3-pip -y; pip3 install ansible ; pip3 install boto3' 
                        '''
                    }
                }
            }
        }

        stage ('Git Cloning Inventory/Playbook Directory') {
            steps {
                script {
                    sshagent(credentials : ['SSH_PRIVATE_KEY']) {
                        sh '''
                        ANSIBLE=$(terraform output | grep ANSIBLE | awk -F'"' '{print $2}')
                        ssh -o StrictHostKeyChecking=no ec2-user@$ANSIBLE '
                        sudo yum install git -y ;
                        if [ ! -d "stock-price-lookup-solut-inventory" ] ;
                        then
                           git clone https://github.com/uthmanakz/stock-price-lookup-solut-inventory.git ;
                        else
                           cd stock-price-lookup-solut-inventory && git pull ;
                           echo "stock-price-lookup-solut-inventory already exists so it has been git pulled instead" ;
                           cd ;
                        fi ;
                        if [ ! -d "stock-price-lookup-solut-playbook" ] ;
                        then
                           git clone https://github.com/uthmanakz/stock-price-lookup-solut-playbook.git ;
                        else
                           cd stock-price-lookup-solut-playbook && git pull ;
                           echo "stock-price-lookup-solut-playbook.git already exists so it has been git pulled instead" ;
                           cd ;
                        fi
                        '
                        '''
                    }
                }
            }
        }
    }
}