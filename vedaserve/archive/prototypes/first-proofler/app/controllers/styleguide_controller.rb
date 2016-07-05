class StyleguideController < ApplicationController

  def fake_id
    if @fake_id.nil?
      @fake_id = 23
    else
      @fake_id += 1
    end
  end

  def index
    @minimal_question = fake_question
    @minimal_question_back = fake_question
    @full_question = fake_question(short_answer: 'A cup of coffee should be sold no less than $3.5')
    @research = Research.new(title: 'My new coffeeshop', description: 'My nailshop failed, so I want to try something new!')
    @new_research = Research.new
  end

  def fake_question(opts={})
    Question.new.tap do |q|
      q.title = 'How much should I charge for a cup of coffee?'
      q.topic = Topic.new(title: 'Revenue stream')
      q.id = self.fake_id

      opts.each do |key, value|
        q.send("#{key}=", value)
      end
    end
  end

end
