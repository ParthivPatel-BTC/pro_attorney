class FavoriteCase < ActiveRecord::Base
belongs_to :case
belongs_to :user
end
