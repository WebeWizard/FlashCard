React = require 'react'
{div,h1} = React.DOM
{Provider, connect} = require 'react-redux'
{connect} = require 'react-redux'
Card = React.createFactory require './card'
ProviderFactory = React.createFactory Provider
Input = React.createFactory require './input'

# Updates props of connected components when state changes
mapStateToProps = (state) ->
  currentGuessText: state.guessText

mapDispatchToProps = (dispatch) ->
  handleGuessTextChange: (guessText) ->
    dispatch
      type: 'UPDATE_GUESS'
      guessText: guessText
  checkAnswer: ->
    dispatch type:"CHECK_ANSWER"

InputConnect = connect(mapStateToProps,mapDispatchToProps) Input
NewInput = React.createFactory InputConnect

UI = React.createClass
  displayName: 'UI'
  render: ->
    #Provider makes the Redux store available to any connected components
    ProviderFactory
        store: @props.store
        div
          id: 'ui-container'
          div
            id: 'card-container'
            Card
              onClick: @props.nextCardClick
              front: @props.front
              back: @props.back
          div style: {width: '100%', height: '70px'},
            div style: {width: '100%'},
              NewInput null
            div
              id: 'nextCardButton'
              onClick: @props.nextCardClick
              "Next Card"


module.exports = UI
