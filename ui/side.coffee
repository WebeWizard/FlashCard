React = require 'react'
{div,span} = React.DOM

Side = React.createClass
  displayName: 'Side'

  render: ->
    hide = (side) =>
      =>
        console.log @props
        @props.hideSide side

    div
      id: @props.side
      className: 'side'
      onClick: hide @props.side
      if @props.visible[@props.side]
        @props.text




module.exports = Side
