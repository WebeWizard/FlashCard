_ = require 'lodash'
React = require 'react'
ReactDOM = require 'react-dom'
{createStore} = require 'redux'
{connect} = require 'react-redux'
require './main.css'

UI =  React.createFactory require './ui/ui'

fronts = ["hello","hi","howdy"]
backs = ["world","earth","pardner"]

initialState =
  index: 0
  frontVisible: true
  backVisible: true

# State reducer, takes an existing state and returns an updated one
reducer = (state=initialState, action) ->
  newState = _.create state
  switch action.type
    when 'NEXT_CARD'
      if state.index+1 is fronts.length then newState.index=0 else newState.index+=1
      newState.frontVisible = true
      newState.backVisible = true
    when 'TOGGLE_SIDE_VISIBLE'
      newState["#{action.side}Visible"] = !newState["#{action.side}Visible"]
  newState

# Create a redux store using the provided reducer
store = createStore reducer

# Updates props of connected components when state changes
mapStateToProps = (state) ->
  front: fronts[state.index]
  back: backs[state.index]

# Passes action dispatchers to connected components as props
mapDispatchToProps = (dispatch) ->
  nextCardClick: ->
    dispatch type: 'NEXT_CARD'

# Connects a React Component with redux state and dispatchers
App = connect(mapStateToProps,mapDispatchToProps) UI
AppFactory = React.createFactory App


ReactDOM.render AppFactory( store: store )
  , document.getElementById('content')
