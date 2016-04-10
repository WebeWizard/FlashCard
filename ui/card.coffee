React = require 'react'
{div,span} = React.DOM

Side = React.createFactory require './side'

Card = React.createClass
  displayName: 'Card'

  render: ->
    div
      id: "card"
      onClick: @props.onClick
      Side
        side: "front"
        text: @props.front
      Side
        side: "back"
        text: @props.back

module.exports = Card
