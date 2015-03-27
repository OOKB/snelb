React = require 'react'

module.exports = React.createClass
  render: ->
    {under, over, mode} = @props
    {files: [u1, u2, u3]} = under
    {files: [o1, o2, o3]} = over

    createUsrUrl = (usr) ->
      "http://mica2015.imgix.net/#{usr}?w=640&h=640&fit=crop"

    createBlendUrl = (underUrl, overUrl) ->
      underUsrUrl = createUsrUrl(underUrl)
      "#{underUsrUrl}&blend=/#{overUrl}&bm=screen&bs=inherit"
    className = "trio #{mode}"

    <div className={className}>
      <ul className={if mode is 'blend' then 'active'}>
        <li><img src={ createBlendUrl(u1, o1) } /></li>
        <li><img src={ createBlendUrl(u2, o2) } /></li>
        <li><img src={ createBlendUrl(u3, o3) } /></li>
      </ul>
      <ul className={if mode is 'under' then 'active'}>
        <li><img src={ createUsrUrl(u1) } /></li>
        <li><img src={ createUsrUrl(u2) } /></li>
        <li><img src={ createUsrUrl(u3) } /></li>
      </ul>
      <ul className={if mode is 'over' then 'active'}>
        <li><img src={ createUsrUrl(o1) } /></li>
        <li><img src={ createUsrUrl(o2) } /></li>
        <li><img src={ createUsrUrl(o3) } /></li>
      </ul>
    </div>
