class Instrument < ActiveRecord::Base
  set_inheritance_column :ruby_type
  default_scope :order => 'created_at DESC'
  belongs_to :user
  has_many :table_row
  has_many :comment
  accepts_nested_attributes_for :table_row, :allow_destroy => false
  paginates_per 20
  has_friendly_id :name, :use_slug => true
  acts_as_taggable
  mount_uploader :sample, SampleUploader

  before_validation :set_upcase_fields

  validates_presence_of :name
  validates_length_of :instrument_name, :maximum => 5
  validates_format_of :envelope, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "PULSE" }
  validates_inclusion_of :wave, :in => ["12.5", "25", "50", "75"], :if => Proc.new { |rec| rec.type == "PULSE" }
  validates_inclusion_of :output, :in => ["LR", "L", "R"]
  validates :length, :presence => true, :special_hex => true, :if => Proc.new { |rec| rec.type == "PULSE" }
  validates_format_of :length, :with => /^[0-9A-F]$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_format_of :sweep, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "PULSE" }
  validates_inclusion_of :vib_type, :in => ["HF", "SIN", "TRI", "SQR"], :if => Proc.new { |rec| rec.type == "PULSE" }
  validates_format_of :pu2_tune, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "PULSE" }
  validates :pu_fine, :presence => true, :special_hex => true, :if => Proc.new { |rec| rec.type == "PULSE" }
  validates_inclusion_of :automate, :in => ["ON", "OFF"]
  validates_inclusion_of :table, :in => ["ON", "OFF"]
  validates_format_of :speed, :with => /^[0-9A-F]$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_format_of :repeat, :with => /^[0-9A-F]$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_format_of :synth_q, :with => /^[0-9A-F]$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_inclusion_of :synth_dist, :in => ["CLIP", "WRAP"], :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_inclusion_of :synth_phase, :in => ["NORMAL", "RESYNC", "RESYNC2"], :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_start_volume, :maximum => 2
  validates_format_of :synth_start_volume, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_start_cutoff, :maximum => 2
  validates_format_of :synth_start_cutoff, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_start_phase, :maximum => 2
  validates :synth_start_phase, :presence => true, :special_hex => true, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_start_vshift, :maximum => 2
  validates_format_of :synth_start_vshift, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_end_volume, :maximum => 2
  validates_format_of :synth_end_volume, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_end_cutoff, :maximum => 2
  validates_format_of :synth_end_cutoff, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_end_phase, :maximum => 2
  validates :synth_end_phase, :presence => true, :special_hex => true, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates_length_of :synth_end_vshift, :maximum => 2
  validates_format_of :synth_end_vshift, :with => /^[A-F0-9]{2}$/, :if => Proc.new { |rec| rec.type == "WAVE" }
  validates :sample, :file_size => { :maximum => 128.kilobyte.to_i }

  def set_upcase_fields
    self.instrument_name.upcase! if !self.instrument_name.blank?
    self.envelope.upcase! if !self.envelope.blank?
    self.length.upcase! if !self.length.blank?
    self.sweep.upcase! if !self.sweep.blank?
    self.pu2_tune.upcase! if !self.pu2_tune.blank?
    self.pu_fine.upcase! if !self.pu_fine.blank?
    self.play.upcase! if !self.play.blank?
    self.wave.upcase! if !self.wave.blank?
    self.synth_wave.upcase! if !self.synth_wave.blank?
    self.synth_phase.upcase! if !self.synth_phase.blank?
    self.synth_start_volume.upcase! if !self.synth_start_volume.blank?
    self.synth_start_cutoff.upcase! if !self.synth_start_cutoff.blank?
    self.synth_start_phase.upcase! if !self.synth_start_phase.blank?
    self.synth_start_vshift.upcase! if !self.synth_start_vshift.blank?
    self.synth_end_volume.upcase! if !self.synth_end_volume.blank?
    self.synth_end_cutoff.upcase! if !self.synth_end_cutoff.blank?
    self.synth_end_phase.upcase! if !self.synth_end_phase.blank?
    self.synth_end_vshift.upcase! if !self.synth_end_vshift.blank?
    self.output.upcase! if !self.output.blank?
    self.synth_filter.upcase! if !self.synth_filter.blank?
    self.synth_q.upcase! if !self.synth_q.blank?
    self.synth_dist.upcase! if !self.synth_dist.blank?
    self.repeat.upcase! if !self.repeat.blank?
    self.speed.upcase! if !self.speed.blank?
    self.shape.upcase! if !self.shape.blank?
    self.vib_type.upcase! if !self.vib_type.blank?
    self.automate.upcase! if !self.automate.blank?
    self.table.upcase! if !self.table.blank?
  end
end
