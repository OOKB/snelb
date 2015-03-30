React = require 'react'
Main = require './main'

module.exports = React.createClass
  render: ->
    {files} = @props

    <div className="container center-text">
      <header>
        <h1>snelb</h1>
      </header>
      <Main files={files} />
      <footer>
        <p>Kai and Kristian having some fun with blending.</p>
        <small>Built by <a href="http://www.ookb.co/">OOKB</a>, Powered by <a href="http://www.cape.io/">CAPE</a></small>
      </footer>
    </div>
