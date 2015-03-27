React = require 'react'

module.exports = React.createClass
  render: ->
    {data, query} = @props

    <main className="eight columns offset-by-two">
      <h2 className="center-text">blended images will go here</h2>
    </main>
