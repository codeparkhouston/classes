<search-input>
  <form onsubmit={onSearch}>
    <div class='form-group'>
      <input
        ref='input'
        type='text'
        class='form-control form-control-lg'
        id='search'
        aria-describedby='searchHelp'
        placeholder='Enter search'>
    </div>
  </form>

  this.on('mount', function(){
    this.refs.input.focus();
  });

  this.onSearch = function(submitEvent){
    submitEvent.stopPropagation();
    submitEvent.preventDefault();
  }


  <style>
    .form-control-lg {
      font-size: 20px;
    }
  </style>

</search-input>