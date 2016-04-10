React = require 'react'
{div,span} = React.DOM

Side = React.createClass
  displayName: 'Side'

  render: ->
    div {id: @props.side, className: 'side'},
      span
        @props.text

module.exports = Side
