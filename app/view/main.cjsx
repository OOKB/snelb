React = require 'react'
Trio = require './trio'

module.exports = React.createClass
  render: ->
    {files} = @props

    <main className="eight columns offset-by-two">
      <p><em>Snelb</em> takes two people at random from <a href="http://www.micagradshow.com">www.micagradshow.com</a> and overlays three of their images on top of one another. The idea is based on Alex Jacque’s thesis project, blens.</p>
      <Trio under={files[0]} over={files[1]} />
    </main>
