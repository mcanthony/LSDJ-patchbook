class Instrument < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  paginates_per 10
  has_friendly_id :name, :use_slug => true
end
