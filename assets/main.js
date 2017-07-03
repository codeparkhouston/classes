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
      // var items = _.groupBy(data, function(item){
      //   if (_.indexOf(item.labels, 'draft') > -1){
      //     return 'draft';
      //   } else {
      //     return 'public';
      //   }
      // });

      // // TODO dedupe with existing projects
      // this.items = items.public;
      // this.drafts = items.draft;
      // this.contents = _(data)
      //   .map(function(project){
      //     return [project.body, project.title, _.map(project.labels, 'name')]})
      //   .flattenDeep()
      //   .join(' ');

      // this.termFrequency.addDocument(this.contents);
      // this.terms = this.termFrequency.listTerms(this.termFrequency.documents.length - 1);

      this.trigger('update');

      return data;
    }
  }

  const app = new App();
  const data = new Data();

  app.xhr
    .get('../data.yml')
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

