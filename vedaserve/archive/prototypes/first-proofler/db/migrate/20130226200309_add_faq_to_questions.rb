class AddFaqToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :faq, :string
  end
end
