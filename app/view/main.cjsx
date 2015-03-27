React = require 'react'
{Link} = require 'react-router'
_ = require 'lodash'

Trio = require './trio'

module.exports = React.createClass
  contextTypes: {
    router: React.PropTypes.func.isRequired
  }
  getInitialState: ->
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
    nextRoute =
      mode: 'blend'
      overIndex: nextOver
      underIndex: nextUnder
    @context.router.transitionTo 'home', nextRoute

  componentDidMount: ->
    {overIndex, underIndex} = @getRandom()
    @setState
      nextOver: overIndex
      nextUnder: underIndex

  render: ->
    {files} = @props
    {overIndex, activeMode, nextOver, nextUnder} = @state
    currentParams = @context.router.getCurrentParams()
    replace = @context.router.replaceWith

    underIndex = parseInt currentParams.underIndex
    overIndex = parseInt currentParams.overIndex
    activeMode = currentParams.mode

    setMode = (mode) ->
      return =>
        replace 'home', _.merge currentParams, {mode:mode}

    <main className="eight columns offset-by-two">
      <p><em>Snelb</em> takes two people at random from <a href="http://www.micagradshow.com">www.micagradshow.com</a> and overlays three of their images on top of one another. The idea is based on <a href="http://www.alexjacque.com/">Alex Jacque</a>’s thesis project, <a href="http://www.micagradshow.com/students/ajacque/">blens</a>.</p>
      <p className="users">
        <button className={if activeMode is 'under' then 'active'} onClick={setMode('under')}>{files[underIndex].uid}</button>
        <button className={if activeMode is 'blend' then 'active'} onClick={setMode('blend')}>BLEND</button>
        <button className={if activeMode is 'over' then 'active'} onClick={setMode('over')}>{files[overIndex].uid}</button>
      </p>
      <Trio under={files[underIndex]} over={files[overIndex]} mode={activeMode} />
      <Trio under={files[nextUnder]} over={files[nextOver]} mode='hide' />
      <button onClick={@nextBlend}>Next!</button>
    </main>
