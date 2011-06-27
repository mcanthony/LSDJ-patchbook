# coding: utf-8
class SpecialHexValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if attribute == :length
      if value.upcase != "UNLIM"
        if !(value.upcase =~ /^[0-3][0-9A-F]$/)
          record.errors[attribute] << "invalid hex"
        end
      end
    end
    if (attribute == :pu_fine) && (record.type == "PULSE")
      if !(value.upcase =~ /^[0-9A-F]$/)
        record.errors[attribute] << "invalid hex"
      end
    end
    if (attribute == :synth_start_phase) || (attribute == :synth_end_phase)
      if !(value.upcase =~ /^[0-1][0-9A-F]$/)
        record.errors[attribute] << "invalid hex"
      end
    end
  end
end
