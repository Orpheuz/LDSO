class Comment < ActiveRecord::Base
  belongs_to :recipe
end

class Review < Comment; end
class Suggestion < Comment; end
class Tip < Comment; end