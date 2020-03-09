require 'discordrb'
bot = Discordrb::Bot.new token: 'Njg2MjAxNDQ1NTI3MTkxNTgy.XmTxNw.H9XFSjcj6l9WgGKEXjQR8ugej5Q'
puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

attackers = ['SLEDGE（スレッジ）',
             'THATCHER（サッチャー）',
             'ASH（アッシュ）',
             'THERMITE（テルミット）',
             'TWITCH（トゥイッチ）',
             'MONTAGNE（モンターニュ）',
             'GLAZ（グラズ）',
             'FUZE（フューズ）',
             'BLITZ（ブリッツ）',
             'IQ（アイキュー）',
             'BUCK（バック）',
             'BLACKBEARD（ブラックビアード）',
             'CAPITAO（キャピタオ）',
             'HIBANA（火花）',
             'JACKAL（ジャッカル）',
             'YING（イン）',
             'ZOFIA（ゾフィア）',
             'DOKKAEBI（ドッカェビィ）'
]
defenders = ['SMOKE（スモーク）',
             'MUTE（ミュート）',
             'PULSE（パルス）',
             'DOC（ドク）',
             'ROOK（ルーク）',
             'KAPKAN（カプカン）',
             'TACHANKA（タチャンカ）',
             'JAGER（イェーガー）',
             'BANDIT（バンディット）',
             'FROST（フロスト）',
             'VALKYRIE（ヴァルキリー）',
             'CAVEIRA（カヴェイラ）',
             'ECHO（エコー）',
             'MIRA（ミラ）',
             'LESION（リージョン）',
             'ELA（エラ）',
             'VIGIL（ヴィジル）'
]
#シージのキャラ
operators = attackers + defenders

# map
#	ヘレフォード基地	[0][7]
#	民家	[1][5]
#	運河	[2][5]
#	銀行	[3][5]
#	オレゴン	[4][5]
#	カフェ	[5][5]
#	クラブハウス	[6][5]
#	領事館	[7][5]
#	山荘	[8][5]
#	タワー	[9][3]
#	テーマパーク	[10][3]
#	大学	[11][3]
#	海岸線	[12][3]
#	国境	[13][3]
#	高層ビル	[14][3]
maps = [
  ['地下','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/HerefordBasement_217064.jpg','1階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/HerefordGround_217065.jpg','2階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/Hereford1_217066.jpg','3階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/Hereford2_217067.jpg'],
  ['地下','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/HouseBasement_217059.jpg','1階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/House1_217060.jpg','2階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/House2_217061.jpg'],
  ['1階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/Kanal%20ground%20floor_227433.png','2階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/Kanal%201st%20floor_227430.png','3階','http://static9.cdn.ubi.com/resource/en-US/game/rainbow6/siege/Kanal%202nd%20floor_227431.png'],
  ['地下','http://www.r6maps.com/img/bank/bank-0.jpg','1階','http://www.r6maps.com/img/bank/bank-1.jpg','2階','http://www.r6maps.com/img/bank/bank-2.jpg'],
  ['地下','http://www.r6maps.com/img/bank/bank-0.jpg','1階','http://www.r6maps.com/img/oregon/oregon-1.jpg	','2階','http://www.r6maps.com/img/oregon/oregon-2.jpg'],
  ['1階','http://www.r6maps.com/img/kafe/kafe-1.jpg','2階','http://www.r6maps.com/img/kafe/kafe-2.jpg','3階','http://www.r6maps.com/img/kafe/kafe-3.jpg'],
  ['地下','http://www.r6maps.com/img/club-house/club-house-1.jpg','1階','http://www.r6maps.com/img/club-house/club-house-1.jpg','2階','http://www.r6maps.com/img/club-house/club-house-2.jpg'],
  ['地下','http://www.r6maps.com/img/consulate/consulate-0.jpg','1階','http://www.r6maps.com/img/consulate/consulate-0.jpg','2階','http://www.r6maps.com/img/consulate/consulate-2.jpg'],
  ['地下','http://www.r6maps.com/img/chalet/chalet-0.jpg','1階','http://www.r6maps.com/img/chalet/chalet-1.jpg','2階','http://www.r6maps.com/img/chalet/chalet-2.jpg'],
  ['1階','http://imgcc.naver.jp/kaze/mission/USER/20171127/71/7381511/1/2889x2785x5a5d62e2fa8e35793463bf.jpg','2階','http://imgcc.naver.jp/kaze/mission/USER/20171127/71/7381511/0/3005x2909x2283b3c47cf2416176866d.jpg'],
  ['1階','http://imgcc.naver.jp/kaze/mission/USER/20170907/71/7381511/0/1199x655x43ab2a8da111b5f39aeec5e.jpg','2階','http://imgcc.naver.jp/kaze/mission/USER/20170907/71/7381511/1/1199x655x31af62b6192d611013ccb22.jpg'],
  ['1階','http://imgcc.naver.jp/kaze/mission/USER/20161224/71/7381511/0/720x405xe61aa88056716ade5f8211f7.jpg','2階','http://imgcc.naver.jp/kaze/mission/USER/20161224/71/7381511/1/720x405xb1c45188fb87dab3f4be18c6.jpg'],
  ['1階','http://imgcc.naver.jp/kaze/mission/USER/20170210/71/7381511/4/1200x675x0847ef488c875ffedc7d520.jpg','2階','http://imgcc.naver.jp/kaze/mission/USER/20170210/71/7381511/3/1200x675x6bd3f5ad382475331b8b8c1.jpg'],
  ['1階','http://imgcc.naver.jp/kaze/mission/USER/20170907/71/7381511/2/812x671xfa07a64e6b1c596792d80cb1.jpg','2階','http://imgcc.naver.jp/kaze/mission/USER/20170907/71/7381511/3/741x661x487beb7154d1aaba7e2b2c9e.jpg'],
  ['1階','http://www.r6maps.com/img/skyscraper/skyscraper-1.jpg','2階','http://www.r6maps.com/img/skyscraper/skyscraper-2.jpg']	]




#"plz attack"とチャットに入力があった場合反応
bot.message(content: 'plz atk') do |event|
  event.respond "#{event.user.name}:#{attackers.sample}をくらえ！"
end

#"plz defense"とチャットに入力があった場合反応
bot.message(content: 'plz def') do |event|
  event.respond "#{event.user.name}:#{defenders.sample}でふせげ！"
end

#"plz character"とチャットに入力があった場合反応
bot.message(content: 'plz character') do |event|
  event.respond "#{event.user.name}:#{operators.sample}を召喚した！"
end

#mapを表示
# mapを表示
bot.message(content: 'map ヘレフォード基地')do |event|
  for map in 0..7
    event.respond "#{maps[0][map]}"
  end
end

bot.message(content: 'map 民家')do |event|
  for map in 0..5
    event.respond "#{maps[1][map]}"
  end
end

bot.message(content: 'map 運河')do |event|
  for map in 0..5
    event.respond "#{maps[2][map]}"
  end
end

bot.message(content: 'map 銀行')do |event|
  for map in 0..5
    event.respond "#{maps[3][map]}"
  end
end

bot.message(content: 'map オレゴン')do |event|
  for map in 0..5
    event.respond "#{maps[4][map]}"
  end
end

bot.message(content: 'map カフェ')do |event|
  for map in 0..5
    event.respond "#{maps[5][map]}"
  end
end

bot.message(content: 'map クラブハウス')do |event|
  for map in 0..5
    event.respond "#{maps[6][map]}"
  end
end

bot.message(content: 'map 領事館')do |event|
  for map in 0..5
    event.respond "#{maps[7][map]}"
  end
end

bot.message(content: 'map 山荘')do |event|
  for map in 0..5
    event.respond "#{maps[8][map]}"
  end
end

bot.message(content: 'map タワー')do |event|
  for map in 0..3
    event.respond "#{maps[9][map]}"
  end
end

bot.message(content: 'map テーマパーク')do |event|
  for map in 0..3
    event.respond "#{maps[10][map]}"
  end
end

bot.message(content: 'map 大学')do |event|
  for map in 0..3
    event.respond "#{maps[11][map]}"
  end
end

bot.message(content: 'map 海岸線')do |event|
  for map in 0..3
    event.respond "#{maps[12][map]}"
  end
end

bot.message(content: 'map 国境')do |event|
  for map in 0..3
    event.respond "#{maps[13][map]}"
  end
end

bot.message(content: 'map 高層ビル')do |event|
  for map in 0..3
    event.respond "#{maps[14][map]}"
  end
end


bot.run