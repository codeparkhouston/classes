(function(window, axios, jsyaml){

  'use strict';

  class App {
    constructor () {
      riot.observable(this);

      this.xhr = axios.create({});
    }

    start (){
      this.trigger('start');
    }
  }

  class Data {
    constructor (response) {
      riot.observable(this);

      this.update(response);
    }

    receive (response) {
      if(!response || !response.data){
        return;
      }
      return response.data;
    }

    translate (yaml) {
      return jsyaml.load(yaml);
    }

    update (data) {
      Object.assign(this, data);

      this.trigger('update');

      return data;
    }
  }

  const app = new App();
  const data = new Data();

  app.xhr
    .get(window.location.href + 'data.yml')
    .then(data.receive.bind(data))
    .then(data.translate.bind(data))
    .then(data.update.bind(data));

  data.on('update', function(){
    riot.mount('app', {
      data: data
    });
  });

  app.start();

})(window, axios, jsyaml);

