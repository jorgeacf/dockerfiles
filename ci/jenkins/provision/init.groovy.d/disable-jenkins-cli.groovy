import jenkins.AgentProtocol
import jenkins.model.Jenkins
import hudson.model.RootAction

//determined if changes were made
configChanged = false

// disabled CLI access over TCP listener (separate port)
def p = AgentProtocol.all()
p.each { x ->
    if(x.name && x.name.contains("CLI")) {
        //println "remove ${x}"
        p.remove(x)
        configChanged = true
    }
}

// disable CLI access over /cli URL
def removal = { lst ->
    lst.each { x ->
        if(x.getClass().name.contains("CLIAction")) {
            //println "remove ${x}"
            lst.remove(x)
            configChanged = true
        }
    }
}
def j = Jenkins.instance;
removal(j.getExtensionList(RootAction.class))
removal(j.actions)

if(configChanged) {
    println 'Jenkins CLI has been disabled.'
} else {
    println 'Nothing changed. Jenkins CLI already disabled.'
}