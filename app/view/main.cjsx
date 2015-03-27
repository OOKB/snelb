React = require 'react'
Trio = require './trio'

module.exports = React.createClass
  render: ->
    {files} = @props

    <main className="eight columns offset-by-two">
      <h2 className="center-text">blended images will go here</h2>
      <Trio files={files[0].files} uid={files[0].uid} />
    </main>
