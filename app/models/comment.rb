class Comment < ActiveRecord::Base
  validates_presence_of :text

  belongs_to :user
  belongs_to :ticket
end
