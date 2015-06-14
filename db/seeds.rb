# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.delete_all()
Answer.delete_all()

(1..5).each do |n|
	que = Question.create(title: "Question #{n}", body: "Content for question #{n}", published: [true, false].sample )
    answer_count = [2,3,4,5].sample
    (1..answer_count).each do |m|
        answer = Answer.create(title:"Answer #{m} for Question #{que.id}",  body:"Some content of the answer for #{que.id}", question_id: que.id )
    end
end