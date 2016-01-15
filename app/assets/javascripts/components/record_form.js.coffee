@RecordForm = React.createClass
  getInitialState: ->
    title: ''
    date: ''
    amount: ''
  render: ->
    React.DOM.form
      className: 'form form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeHolder: 'Date'
          name: 'date'
          value: @state.date
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeHolder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'number'
          className: 'form-control'
          placeHolder: 'Amount'
          name: 'amount'
          value: @state.amount
          onChange: @handleChange
        React.DOM.button
          type: 'submit'
          className: 'btn btn-primary'
          disabled: !@valid()
          'Create New Record'

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { record: @state }, (data) =>
      @props.handleNewRecord data
      @setState @getInitialState()
      'JSON'

  getInitialState: ->
    edit: false
  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  valid: ->
    @state.title && @state.date && @state.amount
