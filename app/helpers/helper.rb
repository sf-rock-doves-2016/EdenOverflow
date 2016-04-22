require 'pry-byebug'
helpers do

  def sort_ratings(questions_array)
    (questions_array.sort_by &:rating).reverse
  end

  def sort_comments(questions_array)
    (questions_array.sort_by &:comment_count).reverse
  end

  def sort_newest(questions_array)
    (questions_array.sort_by &:created_at).reverse
  end

end
