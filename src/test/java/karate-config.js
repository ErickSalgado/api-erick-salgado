function fn() {
  var env = karate.env;
  karate.log('karate.env system property was: ', env);
  if (!env) {
    env = 'dev'
  }
  var regres = 'https://reqres.in/';

  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if(env == 'dev'){
    // customize
    // e.g. config.foo = 'bar';
  } else if(enf == 'e2e') {
    // customize
  }
  return config;
}