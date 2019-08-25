import jenkins.*  
import hudson.*
import jenkins.model.JenkinsLocationConfiguration

import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.security.s2m.AdminWhitelistRule
import jenkins.model.Jenkins

Thread.start {  
    System.setProperty('jenkins.install.runSetupWizard', "false")
    println "--> Startup Wizard is disabled"

    System.setProperty('java.io.tmpdir','/var/jenkins_home')
    println "--> Setting java.io.tmpdir"

    jenkinsLocationConfiguration = JenkinsLocationConfiguration.get()
	jenkinsLocationConfiguration.setUrl("http://localhost:8080/")
	jenkinsLocationConfiguration.setAdminAddress("jorgefigueiredo@outlook.com")
	jenkinsLocationConfiguration.save()

	def jenkins = Jenkins.instance
	jenkins.setCrumbIssuer(new DefaultCrumbIssuer(true))
	jenkins.getInjector().getInstance(AdminWhitelistRule.class).setMasterKillSwitch(false)
	jenkins.save()
}