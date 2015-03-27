React = require 'react'

module.exports = React.createClass
  render: ->
    {files: [one, two, three], uid} = @props
    <ul>
      <li><img src={'http://mica2015.imgix.net/' + one + '?w=640&h=640&fit=crop'} /></li>
      <li><img src={'http://mica2015.imgix.net/' + two + '?w=640&h=640&fit=crop'} /></li>
      <li><img src={'http://mica2015.imgix.net/' + three + '?w=640&h=640&fit=crop'} /></li>
    </ul>
