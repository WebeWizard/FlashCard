React = require 'react'
{div,input} = React.DOM

Input = React.createClass
  displayName: 'Card Input'

  render: ->
    handleChange = (event) =>
      @props.handleGuessTextChange event.target.value

    div id: 'guessInput',
      input
        type: 'text'
        onChange: handleChange
        value: @props.currentGuessText
      div
        style: {width: '100px'}
        onClick: @props.checkAnswer
        'enter'

module.exports = Input
