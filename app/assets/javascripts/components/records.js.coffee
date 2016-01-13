@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultProps: ->
    records: []
  render: ->
    React.DOM.div
     className: 'records container'
     React.DOM.h2
      className: 'title'
      'Records'
     React.DOM.div
       className: 'container'
       React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.td null, 'Date'
            React.DOM.td null, 'Title'
            React.DOM.td null, 'Amount'
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record
