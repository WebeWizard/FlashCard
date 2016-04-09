React = require 'react'
ReactDOM = require 'react-dom'

Hello =  React.createFactory require './ui/hello'

ReactDOM.render Hello( color: 'red'), document.getElementById('content')
