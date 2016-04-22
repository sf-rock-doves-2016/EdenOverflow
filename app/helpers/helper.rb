require 'pry-byebug'
helpers do

  def sort_ratings(questions_array)
    (questions_array.sort_by &:rating).reverse
  end

end
