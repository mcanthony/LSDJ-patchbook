class TableRow < ActiveRecord::Base
  belongs_to :instrument
  before_validation :set_upcase_fields

  validates_length_of :row, :maximum => 1
  validates_inclusion_of :row, :in => ["1", "2", "3", "4", "5", "6", "7", "8", "A", "B", "C", "D", "E", "F"]
  validates_length_of :vol, :maximum => 2
  validates_length_of :tsp, :maximum => 2
  validates_length_of :cmd1, :maximum => 7
  validates_length_of :cmd1, :maximum => 7
  validates_format_of :vol, :with => /^[A-F0-9]{2}$/
  validates_format_of :tsp, :with => /^[A-F0-9]{2}$/
  validates :cmd1, :presence => true, :lsdj_command => true
  validates :cmd2, :presence => true, :lsdj_command => true

  def set_upcase_fields
    self.vol.upcase! if !self.vol.blank?
    self.tsp.upcase! if !self.tsp.blank?
    self.cmd1.upcase! if !self.cmd1.blank?
    self.cmd2.upcase! if !self.cmd2.blank?
  end
end
