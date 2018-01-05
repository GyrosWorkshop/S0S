express = require('express')
tgBot = require('node-telegram-bot-api')
app = express()

token = process.env.SOSTOKEN
groupId = -115603870

bot = new tgBot token,
  polling: true

app.use express.json()

app.get '/', (req, res) -> res.send 'hello'

app.post '/', (req, res) ->
  await bot.sendMessage groupId, JSON.stringify(req.body)
  res.send req.body

app.listen 3000, () -> console.log 'on 3000'
