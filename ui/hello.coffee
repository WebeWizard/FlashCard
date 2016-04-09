React = require 'react'
{div, h1} = React.DOM

Hello = React.createClass
  displayName: 'HelloReact'
  render: ->
    console.log @props
    div null,
      h1 style: color: @props.color,
        "hi mom"

module.exports = Hello
