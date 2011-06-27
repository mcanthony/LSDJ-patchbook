# coding: utf-8
class LsdjCommandValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    cmd = value[0]
    hex = value[1,2]
    if !"-ACEFGHKLMOPRSTVW".include?(cmd.upcase)
      record.errors[attribute] << "invalid LSDJ command"
    end
    if !(hex.upcase =~ /^[A-F0-9]{2}$/)
      record.errors[attribute] << "invalid hex"
    end
    if cmd == "W" # WAVE
      st = false
      if value =~ /^W[A-F0-9]{2}12[.]5$/
        st = true
      end
      if value =~ /^W[A-F0-9]{2}25$/
        st = true
      end
      if value =~ /^W[A-F0-9]{2}50$/
        st = true
      end
      if value =~ /^W[A-F0-9]{2}75$/
        st = true
      end
      if !st
        record.errors[attribute] << "cmd wave error #{value}"
      end
    end
    if cmd == "O" # output
      st = false
      # L
      if value =~ /^O[A-F0-9]{2}[L]$/
        st = true
      end
      # R
      if value =~ /^O[A-F0-9]{2}[R]$/
        st = true
      end
      # LR
      if value =~ /^O[A-F0-9]{2}LR$/
        st = true
      end
      if !st
        record.errors[attribute] << "cmd output error #{value}"
      end
    end
  end
end
