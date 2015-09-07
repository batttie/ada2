sendcontent = ->
  While clnt >= cnum
  cnum = cnum + 1
  content = data.sections[xnum].content[cnum].text                                             
  res.send "#{content}"

sendtitle = ->
  While lnt >= xnum
  xnum = xnum + 1
  datan = data.sections[xnum]
  htitle = datan.title
  clnt = datan.content.length
  res.send "*#{htitle}*"
  sendcontent
