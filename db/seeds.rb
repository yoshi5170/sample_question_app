# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#<User:0x000000011271e090
# id: 1,
# name: "admin",
# email: "sample@example.com",


# 10個の診断質問を作成
# questions_texts = [
#   "質問1の内容",
#   "質問2の内容",
#   "質問3の内容",
#   "質問4の内容",
#   "質問5の内容",
#   "質問6の内容",
#   "質問7の内容",
#   "質問8の内容",
#   "質問9の内容",
#   "質問10の内容"
# ]

# questions_texts.each do |question_text|
#   question = DiagnosisQuestion.create!(question_text: question_text)

#   # 各質問に対する4つの選択肢を作成
#   choices_data = [
#     { text: "全く当てはまらない", score: 1 },
#     { text: "あまり当てはまらない", score: 2 },
#     { text: "まあまあ当てはまる", score: 3 },
#     { text: "とても当てはまる", score: 4 }
#   ]

#   choices_data.each do |choice_data|
#     Choice.create!(
#       diagnosis_question_id: question.id,
#       choice_text: choice_data[:text],
#       score: choice_data[:score]
#     )
#   end
# end

# puts "Sample data created successfully!"



# DiagnosisResult.create([
#   {
#     score_range_start: 10,
#     score_range_end: 19,
#     result_text: "あなたは自分自身に対する肯定的な視点を持つ傾向があるようです。この力を活かして、自己肯定的な思考をさらに深めるために、日記機能を積極的に使ってみましょう。"
#   },
#   {
#     score_range_start: 20,
#     score_range_end: 29,
#     result_text: "あなたは非常に自分自身に対する肯定的な視点を持っています。この自信はあなたの強みとなり、多くのチャンスや可能性を引き寄せるでしょう。"
#   },
#   {
#     score_range_start: 30,
#     score_range_end: 40,
#     result_text: "あなたは極めて自己肯定的な傾向が強いです。この自覚を持ちつつ、他人との関係性やコミュニケーションにも注意を払うことで、さらなる成功が期待されます。"
#   }
# ])



questions = [
  {
    text: "朝起きたら、まず何をしますか？",
    choices: [
      { text: "スマホをチェックする", score: 1 },
      { text: "伸びをして深呼吸する", score: 2 },
      { text: "5分だけ二度寝する", score: 3 }
    ]
  },
  {
    text: "お気に入りのアイスクリームの味は？",
    choices: [
      { text: "チョコレート", score: 3 },
      { text: "バニラ", score: 1 },
      { text: "宇治抹茶", score: 2 }
    ]
  },
  {
    text: "休日の過ごし方は？",
    choices: [
      { text: "家でのんびり", score: 2 },
      { text: "アウトドアでアクティブに", score: 3 },
      { text: "買い物や映画鑑賞", score: 1 }
    ]
  },
  {
    text: "好きな動物は？",
    choices: [
      { text: "猫", score: 1 },
      { text: "犬", score: 3 },
      { text: "パンダ", score: 2 }
    ]
  },
  {
    text: "あなたの好きな季節は？",
    choices: [
      { text: "夏", score: 3 },
      { text: "春", score: 2 },
      { text: "冬", score: 1 }
    ]
  },
  {
    text: "旅行に行くならどこ？",
    choices: [
      { text: "海外の都市", score: 2 },
      { text: "日本の田舎", score: 1 },
      { text: "トロピカルビーチ", score: 3 }
    ]
  },
  {
    text: "読むのはどれが好き？",
    choices: [
      { text: "小説", score: 2 },
      { text: "コミック", score: 1 },
      { text: "新聞や雑誌", score: 3 }
    ]
  },
  {
    text: "あなたの好きな音楽ジャンルは？",
    choices: [
      { text: "J-POP", score: 1 },
      { text: "クラシック", score: 3 },
      { text: "ロック", score: 2 }
    ]
  },
  {
    text: "絵を描くとしたら、何を描きたい？",
    choices: [
      { text: "風景", score: 2 },
      { text: "人物", score: 1 },
      { text: "抽象画", score: 3 }
    ]
  },
  {
    text: "一番好きな時間帯は？",
    choices: [
      { text: "昼間", score: 1 },
      { text: "夜", score: 2 },
      { text: "早朝", score: 3 }
    ]
  }
]

questions.each do |q|
  question = Question.create!(text: q[:text])
  q[:choices].each do |c|
    question.choices.create!(text: c[:text], score: c[:score])
  end
end

puts "Questions data created successfully!"


results = [
  { min_score: 10, max_score: 16, description: "内向的な夢見るアーティスト - 静かな環境での時間を楽しむあなた。深い感受性を持っていて、日常の中に美しさを見つける才能があります。" },
  { min_score: 17, max_score: 24, description: "アドベンチャラスな自然愛好者 - アクティブで、新しい経験や冒険を求めるあなた。自然の中で最高の時間を過ごすことができます。" },
  { min_score: 25, max_score: 30, description: "社交的な都市の住人 - 人との交流や都市の活気を楽しむあなた。新しいトレンドや情報をキャッチするのが得意です。" }
]

results.each do |result_data|
  Result.find_or_create_by!(result_data)
end

puts "Result data created successfully!"