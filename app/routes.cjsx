React = require 'react'
{Route, DefaultRoute, Redirect} = require 'react-router'

Index = require './view/index'
Home = require './view/home'

module.exports =

  <Route name="app" path="/" handler={Index} ignoreScrollBehavior>
    <Redirect from="/" to="/6/5/blend" />
    <Route name="home" path="/:underIndex/:overIndex/:mode" handler={Home} />
  </Route>
