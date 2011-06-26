class CreateInstruments < ActiveRecord::Migration
  def self.up
    create_table :instruments do |t|
      t.string :type, :null => false # WAVE PULSE NOISE
      t.string :author, :null => true
      t.boolean :share, :null => false, :default => 1
      t.text :description

      t.string :name
      t.string :envelope
      t.string :wave
      t.string :output
      t.string :length
      t.string :shape
      t.string :sweep
      t.string :vib_type
      t.string :pu2_tune
      t.string :pu_fine
      t.string :automate
      t.string :table

      t.string :volume
      t.string :play
      t.string :repeat
      t.string :speed

      t.string :synth_wave
      t.string :synth_filter
      t.string :synth_q
      t.string :synth_dist
      t.string :synth_phase
      t.string :synth_start_volume
      t.string :synth_start_cutoff
      t.string :synth_start_phase
      t.string :synth_start_vshift
      t.string :synth_end_volume
      t.string :synth_end_cutoff
      t.string :synth_end_phase
      t.string :synth_end_vshift

      # Table, 14 rows
      t.string :table_content, :null => true # a JSON encoded content of the Table

      t.timestamps
    end
  end

  def self.down
    drop_table :instruments
  end
end
