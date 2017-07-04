<session>
  <div class='list-group-item list-group-item-action' target='_blank'>
    <h4 class='list-group-item-heading'>{opts.data.title}</h4>
    <markdown class='description' content={opts.data.description} if={opts.data.description}/>

    <section>
      <h5 if={opts.data.objectives && opts.data.objectives.length > 0}>Objectives</h5>
      <ul if={opts.data.objectives}>
        <li each={opts.data.objectives}>
          {this.name}
        </li>
      </ul>
    </section>

  </div>

  <style>

/*    .description {
      display: none;
    }*/
  </style>
</session>