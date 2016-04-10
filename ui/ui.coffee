React = require 'react'
{div,h1} = React.DOM
Card = React.createFactory require './card'

UI = React.createClass
  displayName: 'UI'

  getInitialState: () ->
    i: 0

  _nextCard: () ->
    i = @state.i+1
    if i >= @props.fronts.length then i = 0
    @setState
      i: i

  render: ->
    div
      id: "card-container"
      Card
        onClick: @_nextCard
        front: @props.fronts[@state.i]
        back: @props.backs[@state.i]

module.exports = UI
