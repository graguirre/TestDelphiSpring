node{
  stage('checkout and build')
  parallel(
    dto: {build ('checkoutDTO')},
    basicos: {build ('checkoutModulosBasicos')}
  )
  parallel(
    testIO: {build ('UnitTestModulosBasicosIO')},
    testUtils: {build ('UnitTestModulosBasicosUtils')},
    dao: {build ('checkoutDAO')}
  )
  build ('checkoutGestor')
  build ('checkoutMVC')
  build ('checkoutAplicacionX')
  stage('deploy') 
  bat ('dir')
}