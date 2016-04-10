React = require 'react'
ReactDOM = require 'react-dom'
require './main.css'

UI =  React.createFactory require './ui/ui'

fronts = ["hello","hi","howdy"]
backs = ["world","earth","pardner"]

ReactDOM.render UI( { fronts: fronts, backs: backs } )
  , document.getElementById('content')
