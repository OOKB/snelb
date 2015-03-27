React = require 'react'
Main = require './main'

module.exports = React.createClass
  render: ->
    {data, query} = @props

    <div className="container center-text">
      <header>
        <h1>snelb</h1>
      </header>
      <Main />
      <footer>
        <p>Kai and Kristian poking some fun at Alex</p>
      </footer>
    </div>
