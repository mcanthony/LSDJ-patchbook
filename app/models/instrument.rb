class Instrument < ActiveRecord::Base
  set_inheritance_column :ruby_type
  default_scope :order => 'created_at DESC'
  belongs_to :user
  has_many :table_row
  accepts_nested_attributes_for :table_row, :allow_destroy => false
  paginates_per 10
  has_friendly_id :name, :use_slug => true

  before_validation :set_upcase_fields

  validates_presence_of :name
  validates_length_of :instrument_name, :maximum => 5
  validates_format_of :envelope, :with => /^[A-F0-9]{2}$/ # Hex check, need to be UPCASE (set_upcase_fields)
  validates_inclusion_of :wave, :in => ["12.5", "25", "50", "75"]
  validates_inclusion_of :output, :in => ["LR", "L", "R"]
  validates :length, :presence => true, :special_hex => true
  validates_format_of :sweep, :with => /^[A-F0-9]{2}$/ # Hex check
  validates_inclusion_of :vib_type, :in => ["HF", "SIN", "TRI", "SQR"]
  validates_format_of :pu2_tune, :with => /^[A-F0-9]{2}$/ # Hex check
  validates :pu_fine, :presence => true, :special_hex => true
  validates_inclusion_of :automate, :in => ["ON", "OFF"]
  validates_inclusion_of :table, :in => ["ON", "OFF"]


  def set_upcase_fields
    self.instrument_name.upcase! if !self.instrument_name.blank?
    self.envelope.upcase! if !self.envelope.blank?
    self.length.upcase! if !self.length.blank?
    self.sweep.upcase! if !self.sweep.blank?
    self.pu2_tune.upcase! if !self.pu2_tune.blank?
    self.pu_fine.upcase! if !self.pu_fine.blank?
  end
end
