pipeline{
	agent{label 'master'}
	environment {
        	registry = "anjurose/media99" 
	        registryCredential = 'HubID1' 
	        dockerImage = '' 
    	}
	stages{
		stage('Checkout'){
			steps{
				git branch: 'main', url: 'https://github.com/AnjuMeleth/testflasky.git'
			}
		}
    		stage('Setup'){
      			steps{
				sh 'chmod +x install.sh'
        			sh './install.sh'
      			}
    		}
    		stage('Test'){
      			steps{
				 sh '''#!/bin/bash
				     source myprojectenv/bin/activate	
                		     python -m unittest
				     '''
               			}
   		}
		stage('invoke playbook'){
      			steps{
				 ansiblePlaybook become: true, installation: 'A1', playbook: './docker_playbook.yml', vaultCredentialsId: 'secret'
               			}
   		}
	}
}
			
