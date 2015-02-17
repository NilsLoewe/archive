class MakeTasksPolymorphic < ActiveRecord::Migration
  def change
    add_column :tasks, :plan_type, :string
    rename_column :tasks, :objective_id, :plan_id
  end
end
