class ChangeQuestionsPublishedDefault < ActiveRecord::Migration
  def up
    change_column_default(:questions, :published, true)
  end
end
