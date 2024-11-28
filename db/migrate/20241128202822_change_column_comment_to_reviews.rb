class ChangeColumnCommentToReviews < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :comment, :text
  end
end
