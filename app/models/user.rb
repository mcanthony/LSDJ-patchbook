class User < ActiveRecord::Base
  acts_as_authentic
  default_scope :order => 'created_at DESC'
  paginates_per 10
  has_friendly_id :login, :use_slug => true
  validates_presence_of :login, :email
end
