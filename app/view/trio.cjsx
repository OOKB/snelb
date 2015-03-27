React = require 'react'

module.exports = React.createClass
  render: ->
    {under, over} = @props
    {files: [u1, u2, u3]} = under
    {files: [o1, o2, o3]} = over
    createBlendUrl = (underUrl, overUrl) ->
      "http://mica2015.imgix.net/#{underUrl}?w=640&h=640&fit=crop&blend=/#{overUrl}&bm=screen&bs=inherit"
    <ul>
      <li><img src={ createBlendUrl(u1, o1) } /></li>
      <li><img src={ createBlendUrl(u2, o2) } /></li>
      <li><img src={ createBlendUrl(u3, o3) } /></li>
    </ul>
