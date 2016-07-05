class RemoveFaqFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :faq
  end

  def down
    add_column :questions, :faq, :string
  end
end
