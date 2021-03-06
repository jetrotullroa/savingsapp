@Records = React.createClass
# to render view
  render: ->
    React.DOM.div
     className: 'records container'
     React.DOM.h2
      className: 'title'
      'Records'
     React.DOM.div
      className: 'row'
      React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Credits'
      React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Debits'
      React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Balance'
     React.createElement RecordForm, handleNewRecord: @addRecord
     React.DOM.hr null
       React.DOM.div
        className: 'table-responsive'
        React.DOM.table
          className: 'table table-bordered table-striped'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.td null, 'Date'
              React.DOM.td null, 'Title'
              React.DOM.td null, 'Amount'
              React.DOM.td null, 'Actions'
          React.DOM.tbody null,
            for record in @state.records
              React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord

# get initial record
  getInitialState: ->
    records: @props.data
  getDefaultProps: ->
    records: []

# to add record
# to delete record
# to update record
  addRecord: (record) ->
    records = React.addons.update(@state.records, { $push: [record] })
    @setState records: records
  deleteRecord: (record) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1]] })
    @replaceState records: records

  updateRecord: (record, data) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
    @replaceState records: records


# credits-debits-balance
  credits: ->
    credits = @state.records.filter (val) -> val.amount >= 0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
    ), 0
  balance: ->
    @debits() + @credits()
