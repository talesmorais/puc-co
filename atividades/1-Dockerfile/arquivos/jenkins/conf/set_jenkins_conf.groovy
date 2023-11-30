import jenkins.model.Jenkins
import jenkins.install.*

def tab="\t\t\t\t\tINFO\t"
def instance = Jenkins.get()

println tab + "Disabling executors on master"
instance.setNumExecutors(0)

println tab + "Setting slave agent port"
Jenkins.instance.setSlaveAgentPort(new Integer(50000))

instance.save()
