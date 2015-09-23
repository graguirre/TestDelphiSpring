import hudson.model.*
import hudson.node_monitors.*
import hudson.slaves.*
import hudson.util.RemotingDiagnostics;

def gitURL = "https://github.com/graguirre/TestDelphiSpring.git"
def command = "git ls-remote -h $gitURL"
  
for (node in jenkins.model.Jenkins.instance.slaves) {
  println "Checking computer ${node.getNodeName()} ${node.getNumExecutors()}"
  def channel = node.getComputer().getChannel()
  if ( channel != "null"){
  	println "Checking computer ${node.getNodeName()}, canal ${channel} disponible" 
	println RemotingDiagnostics.executeGroovy(command, channel);
  }
  
}