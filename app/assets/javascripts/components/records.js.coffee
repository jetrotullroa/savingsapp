@Records = React.createClass
  addRecord: (record) ->
    records = @state.records.slice()
    records.push record
    @setState records: records


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
     React.createElement RecordForm, handleNewRecord: @addRecord
     React.DOM.hr null
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
