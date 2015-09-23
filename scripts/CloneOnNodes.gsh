import hudson.model.*
import hudson.node_monitors.*
import hudson.slaves.*
import hudson.util.RemotingDiagnostics;

command = '''
def proc = "cmd.exe /c dir".execute(); 
println "${proc.text}"
println proc.exitValue();
''';
  
for (node in jenkins.model.Jenkins.instance.slaves) {
  println "Checking computer ${node.getNodeName()} ${node.getNumExecutors()}"
  def channel = node.getComputer().getChannel()
  if ( channel ){
  	println "Nodo ${node.getNodeName()}, canal ${channel} disponible" 
	println RemotingDiagnostics.executeGroovy(command, channel);
  }
  else{
  	println "Nodo ${node.getNodeName()}, sin canal disponible"     
  }
  
}