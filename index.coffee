React = require 'react'
ReactDOM = require 'react-dom'
{createStore} = require 'redux'
{connect} = require 'react-redux'
require './main.css'

UI =  React.createFactory require './ui/ui'

fronts = ["hello","hi","howdy"]
backs = ["world","earth","pardner"]

# State reducer, takes an existing state and returns an updated one
reducer = (state=0, action) ->
  switch action.type
    when 'NEXT_CARD'
      if state+1 is fronts.length then 0 else state+1
    else state

# Create a redux store using the provided reducer
store = createStore reducer

# Updates props of connected components when state changes
mapStateToProps = (state) ->
  front: fronts[state]
  back: backs[state]

# Passes action dispatchers to connected components as props
mapDispatchToProps = (dispatch) ->
  nextCardClick: ->
    dispatch type: 'NEXT_CARD'

# Connects a React Component with redux state and dispatchers
App = connect(mapStateToProps,mapDispatchToProps) UI
AppFactory = React.createFactory App


ReactDOM.render AppFactory( store: store )
  , document.getElementById('content')
