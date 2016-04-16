_ = require 'lodash'
React = require 'react'
ReactDOM = require 'react-dom'
{createStore} = require 'redux'
{connect} = require 'react-redux'
require './main.css'

UI =  React.createFactory require './ui/ui'

fronts = ["Hello(formal)","Hello(personal)","Goodbye(leaving)","Goodbye(staying)"]
backs = ["안녕항십니까","안녕하세요","안녕히 계세요","안녕히 가세요"]

initialState =
  index: 0
  frontVisible: true
  backVisible: false
  guessText: ""

# State reducer, takes an existing state and returns an updated one
reducer = (state=initialState, action) ->
  newState = _.clone state
  switch action.type
    when 'NEXT_CARD'
      if state.index+1 is fronts.length then newState.index=0 else newState.index++
      newState.frontVisible = true
      newState.backVisible = false
      newState.guessText = ""
    when 'TOGGLE_SIDE_VISIBLE'
      newState["#{action.side}Visible"] = !newState["#{action.side}Visible"]
    when 'UPDATE_GUESS'
      newState.guessText = action.guessText
      console.log 'newGuessText',newState.guessText
    when "CHECK_ANSWER"
      if newState.guessText is backs[newState.index]
        console.log "CORRECT"
      else
        console.log "WRONG"
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
