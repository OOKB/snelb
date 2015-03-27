React = require 'react'
Trio = require './trio'
_ = require 'lodash'

module.exports = React.createClass
  getInitialState: ->
    underIndex: 6
    overIndex: 5
    activeMode: 'blend'
    nextOver: 7
    nextUnder: 8

  getRandom: ->
    {files} = @props
    rand = ->
      _.random 0, files.length-1
    ui = rand()
    oi = rand()
    if oi is ui then oi = rand()
    if oi is ui then oi = rand()
    underIndex: ui
    overIndex: oi

  nextBlend: ->
    {overIndex, underIndex} = @getRandom()
    {nextOver, nextUnder} = @state

    @setState
      nextOver: overIndex
      nextUnder: underIndex
      activeMode: 'blend'
      underIndex: nextUnder
      overIndex: nextOver

  componentDidMount: ->
    {overIndex, underIndex} = @getRandom()
    @setState
      nextOver: overIndex
      nextUnder: underIndex

  render: ->
    {files} = @props
    {underIndex, overIndex, activeMode, nextOver, nextUnder} = @state

    setModeUnder = => @setState activeMode: 'under'
    setModeOver = => @setState activeMode: 'over'
    setModeBlend = => @setState activeMode: 'blend'

    <main className="eight columns offset-by-two">
      <p><em>Snelb</em> takes two people at random from <a href="http://www.micagradshow.com">www.micagradshow.com</a> and overlays three of their images on top of one another. The idea is based on <a href="http://www.alexjacque.com/">Alex Jacque</a>’s thesis project, <a href="http://www.micagradshow.com/students/ajacque/">blens</a>.</p>
      <p className="users">
        <button className={if activeMode is 'under' then 'active'} onClick={setModeUnder}>{files[underIndex].uid}</button>
        <button className={if activeMode is 'blend' then 'active'} onClick={setModeBlend}>BLEND</button>
        <button className={if activeMode is 'over' then 'active'} onClick={setModeOver}>{files[overIndex].uid}</button>
      </p>
      <Trio under={files[underIndex]} over={files[overIndex]} mode={activeMode} />
      <Trio under={files[nextUnder]} over={files[nextOver]} mode='hide' />
      <button onClick={@nextBlend}>Next!</button>
    </main>
