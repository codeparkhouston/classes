<workshop-list>
  <div class='list-group' id='workshops'>
    <workshop each={opts.workshops} data={this}/>
  </div>

  this.on('mount', function(){
    this.setupLinksNew();
  });

  this.on('updated', function(){
    this.setupLinksNew();
  });

  this.setupLinksNew = function(){
    Array.prototype.forEach.call(this.root.getElementsByTagName('a'), function(link){
      link.target = '_blank';
    });
  }.bind(this);

  this.setupQuickSearch = function(){
    return new Jets({
      searchTag: '#search',
      contentTag: '#workshops',
      searchSelector: '*OR'
    });
  }

</workshop-list>