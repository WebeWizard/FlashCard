React = require 'react'
{div,span} = React.DOM
_ = require 'lodash'

Side = React.createClass
  displayName: 'Side'

  render: ->
    hide = (side) =>
      =>
        @props.hideSide side

    div
      id: @props.side
      className: 'side'
      onClick: hide @props.side
      span
        style:
          visibility: unless @props.visible[@props.side] then 'hidden'
        @props.text


module.exports = Side
