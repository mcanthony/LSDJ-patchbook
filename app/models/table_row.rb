class TableRow < ActiveRecord::Base
  belongs_to :instrument
  validates_length_of :row, :maximum => 1
  validates_inclusion_of :row, :in => ["1", "2", "3", "4", "5", "6", "7", "8", "A", "B", "C", "D", "E", "F"]
  validates_length_of :vol, :maximum => 2
  validates_length_of :tsp, :maximum => 2
  validates_length_of :cmd1, :maximum => 3
  validates_length_of :cmd1, :maximum => 3
end
