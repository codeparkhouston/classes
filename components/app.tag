<app>
  <div class='container'>
    <div class='row'>
      <div class='col'>
        <h1 class='brand'>Code Park Classes</h1>
        <markdown content={opts.data.description} if={opts.data.description}/>
      </div>
    </div>
  </div>
  <div class='container'>
    <div class='row'>
      <div class='col'>
        <workshop-list workshops={opts.data.workshops}/>
      </div>
    </div>
  </div>
</app>