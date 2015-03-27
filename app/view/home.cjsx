React = require 'react'
Main = require './main'

module.exports = React.createClass
  render: ->
    {files} = @props

    <div className="container">
      <header>
        <h1 className="center-text">snelb</h1>
      </header>
      <Main files={files} />
      <footer>
        <p>Kai and Kristian poking some fun at Alex Jacque...</p>
      </footer>
    </div>
