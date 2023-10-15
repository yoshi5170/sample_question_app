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
questions_texts = [
  "質問1の内容",
  "質問2の内容",
  "質問3の内容",
  "質問4の内容",
  "質問5の内容",
  "質問6の内容",
  "質問7の内容",
  "質問8の内容",
  "質問9の内容",
  "質問10の内容"
]

questions_texts.each do |question_text|
  question = DiagnosisQuestion.create!(question_text: question_text)

  # 各質問に対する4つの選択肢を作成
  choices_data = [
    { text: "全く当てはまらない", score: 1 },
    { text: "あまり当てはまらない", score: 2 },
    { text: "まあまあ当てはまる", score: 3 },
    { text: "とても当てはまる", score: 4 }
  ]

  choices_data.each do |choice_data|
    Choice.create!(
      diagnosis_question_id: question.id,
      choice_text: choice_data[:text],
      score: choice_data[:score]
    )
  end
end

puts "Sample data created successfully!"



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

