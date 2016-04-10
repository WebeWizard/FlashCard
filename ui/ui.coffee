React = require 'react'
{div,h1} = React.DOM
{Provider, connect} = require 'react-redux'
Card = React.createFactory require './card'
ProviderFactory = React.createFactory Provider

UI = React.createClass
  displayName: 'UI'
  render: ->
    #Provider makes the Redux store available to any connected components
    ProviderFactory
        store: @props.store
        div
          id: "card-container"
          Card
            onClick: @props.nextCardClick
            front: @props.front
            back: @props.back

module.exports = UI
