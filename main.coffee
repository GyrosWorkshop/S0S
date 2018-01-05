express = require('express')
tgBot = require('node-telegram-bot-api')
pug = require('pug')

app = express()
file = pug.compileFile './static/index.jade'

token = process.env.SOSTOKEN
groupId = -115603870

bot = new tgBot token,
  polling: true

app.use express.urlencoded()

app.get '/', (req, res) -> res.send file()

app.post '/', (req, res) ->
  {name, content} = req.body
  message = "SOS received, from: #{name}, content: #{content}"
  await bot.sendMessage groupId, message
  res.send file()

app.listen 3000, () -> console.log 'on 3000'
