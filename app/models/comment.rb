class Comment < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  belongs_to :instrument
  belongs_to :user
  paginates_per 10
  validates_presence_of :comment
end
