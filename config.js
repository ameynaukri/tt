var config = {
    server: {
      id: "environment",
      name: "demo",
      host: "localhost",
      internalPort: "3016",
      protocol : "http",
      web_uri: "http://localhost:3016"
    },
    
    logging : {
      level : 'debug', //Can be 'debug' , 'warn', 'info', 'error'
      loggers : {
        graylog : { type :'graylog' , host : 'localhost' , port : 12201 },
        local : {type: 'local' }
      }
    },
    database: {
      client:'mysql',
      connection: {
        host:'127.0.0.1',
        port:'3306',
        user: 'root',
        password: '',
        //database: 'SmartParking',
        database: 'test',
        charset: 'utf8'
      }
    },
    session: {
      secret: 'A Super Special And Fantastic Secret!'
    },
    webUri: 'http://localhost:3016',
    web_name: "Cns",
    Authorkey : "Ak12mr27Xwg@d89ul",
};

module.exports = config;

