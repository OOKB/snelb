React = require 'react'
Trio = require './trio'
_ = require 'lodash'

module.exports = React.createClass
  getInitialState: ->
    underIndex: 6
    overIndex: 5
    activeMode: 'blend'

  nextBlend: ->
    {files} = @props
    rand = ->
      _.random 0, files.length-1
    ui = rand()
    oi = rand()
    if oi is ui then oi = rand()
    @setState
      underIndex: ui
      overIndex: oi

  render: ->
    {files} = @props
    {underIndex, overIndex, activeMode} = @state

    <main className="eight columns offset-by-two">
      <p><em>Snelb</em> takes two people at random from <a href="http://www.micagradshow.com">www.micagradshow.com</a> and overlays three of their images on top of one another. The idea is based on Alex Jacque’s thesis project, blens.</p>
      <button onClick={@nextBlend}>Next!</button>
      <Trio under={files[underIndex]} over={files[overIndex]} mode={activeMode} />
      <p className="users">
        <button className="under">{files[underIndex].uid}</button>
        -
        <button className="over">{files[overIndex].uid}</button>
      </p>
    </main>
