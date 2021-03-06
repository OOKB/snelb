React = require 'react'
{Link} = require 'react-router'
{RouteHandler} = require 'react-router'

module.exports = React.createClass
  contextTypes: {
    router: React.PropTypes.func.isRequired
  }
  render: ->
    {sha, description, author, title, files} = @props
    appFileName = sha or 'app'
    cssFilePath = "/assets/#{appFileName}.css"
    jsFilePath = "/assets/#{appFileName}.js"

    if author
      metaAuthor = <meta name="author" content={author} />
    else
      metaAuthor = false

    if description
      metaDescription = <meta name="description" content={description} />
    else
      metaDescription = false

    {underIndex, overIndex} = @context.router.getCurrentParams()
    if underIndex or overIndex
      title += " | #{files[underIndex].uid} & #{files[overIndex].uid}"
    <html>
      <head>
        <title>{title or 'title'}</title>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" type="text/css" href={cssFilePath} />
        <meta name="generator" content="CAPE.io, see www.cape.io" />
        {metaAuthor} {metaDescription}
      </head>
      <body>
        {React.createElement(RouteHandler, @props)}
        <script src={jsFilePath} type="text/javascript" />
      </body>
    </html>
