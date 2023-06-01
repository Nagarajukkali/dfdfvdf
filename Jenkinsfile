@Library('ea-jenkins-shared@master')

steps=new au.com.energyaustralia.jenkins.JenkinsPipelineSteps()

final String GITLAB_PROJECT_ID='227'
final String SONARQUBE_PROJECT_KEY='click-to-pay'
final String MAIN_BRANCH='develop'

properties([
	[$class: 'GitLabConnectionProperty', gitLabConnection: 'EALAN Gitlab'],
	[$class: 'CopyArtifactPermissionProperty', projectNames: '*'],
	[$class: 'jenkins.model.BuildDiscarderProperty', strategy: [$class: 'LogRotator', numToKeepStr: '4', artifactNumToKeepStr: '4']]
]);

node('java_build_slave_frontend') {
	stage('Checkout') {
		checkout scm
	}
	try {
      nodejs(configId: 'f1ebab20-663b-4c7c-889b-84e59d033c01', nodeJSInstallationName: 'node_v18_10_npm_v8_19') {
			gitlabCommitStatus (name: 'build') {
				stage ('Build') {
					runBuild();
				}
			}
			gitlabCommitStatus (name: 'test') {
				stage ('Test') {
					runTests();
				}
			}
		}

		stage("OSSDepCheck") {
            def targetPath="package.json,package-lock.json"
            steps.vulnerabilityScan(targetPath, "/home/jenkins/owasp")
        }


		stage('Scan') {
			steps.scan(SONARQUBE_PROJECT_KEY, MAIN_BRANCH, GITLAB_PROJECT_ID,
			'sonar.typescript.lcov.reportPaths=coverage/lcov.info',
			'sonar.tests=src/tests')
		}

		stage('Stash') {
			archiveArtifacts 'dist/**'
		}

		def currResult=currentBuild.result ?: 'SUCCESS'
		boolean isSuccess=(currResult =='SUCCESS')
		if (isSuccess && env.BRANCH_NAME =='develop') {
			stage ('Deploy to Espresso') {
				deployToEspresso('click-to-pay')
			}
		}
	} finally {
		step([$class: 'WsCleanup'])
	}
}

def runBuild () {
	sh 'npm install --force'
}

def runTests () {
	try {
		sh 'npm run e2e:all'
	} finally {
		saveTestReports()
	}
}

def saveTestReports () {
	publishHtmlReport('ClickToPay Report', 'coverage/');
}

def publishHtmlReport(reportName, path) {
	publishHTML (target: [
		allowMissing: false,
		alwaysLinkToLastBuild: false,
		keepAll: true,
		reportDir: path,
		reportFiles: 'index.html',
		reportName: reportName
	])
}

def deployToEspresso(frontend) {
	build job: 'deploy-application-to-s3', parameters: [
			string(name: 'APPLICATION', value: 'click-to-pay'),
			string(name: 'ENV', value: 'espresso'),
			string(name: 'PROD_BUILD', value: ''),
			string(name: 'FREESTYLE_JOB', value: 'N'),
			string(name: 'APP_JOB', value: 'click-to-pay'),
			string(name: 'BRANCH', value: env.BRANCH_NAME),
			string(name: 'BRANCH_DISPLAY', value: env.BRANCH_NAME),
			string(name: 'BUILD', value: currentBuild.number.toString()),
			string(name: 'ANGULAR_PROJECT', value: 'N/A')
		],
		wait: false
}
