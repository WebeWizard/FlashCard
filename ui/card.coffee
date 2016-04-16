React = require 'react'
{div,span} = React.DOM
{connect} = require 'react-redux'

Side = React.createFactory require './side'

# Updates props of connected components when state changes
mapStateToProps = (state) ->
  visible:
    front: state.frontVisible
    back: state.backVisible

# Passes action dispatchers to connected components as props
mapDispatchToProps = (dispatch) ->
  hideSide: (side) ->
    dispatch
      type: 'TOGGLE_SIDE_VISIBLE'
      side: side

# Connects a React Component with redux state and dispatchers
newSide = connect(mapStateToProps,mapDispatchToProps) Side
newSideFactory = React.createFactory newSide

Card = React.createClass
  displayName: 'Card'

  render: ->
    div
      id: "card"
      newSideFactory
        side: "front"
        text: @props.front
      newSideFactory
        side: "back"
        text: @props.back



module.exports = Card
