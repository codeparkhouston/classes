<workshop>
  <div class='list-group-item list-group-item-action'>
    <h2 class='list-group-item-heading brand' if={opts.data.title}>{opts.data.title}</h2>
    <markdown class='description' content={opts.data.description} if={opts.data.description}/>

    <p if={opts.data.is_ready === false}><i>More details coming soon.</i></p>

    <section>
      <h3 if={opts.data.objectives && opts.data.objectives.length > 0}>Objectives</h3>
      <ul if={opts.data.objectives}>
        <li each={opts.data.objectives}>
          {this.name}
        </li>
      </ul>
    </section>

    <section>
      <h3 if={opts.data.sessions && opts.data.sessions.length > 1}>Schedule</h3>
      <session-list sessions={opts.data.sessions}/>
    </section>

  </div>

  <style>
    :scope {
      padding: 1em 0;
      display: block;
    }
  </style>
</workshop>