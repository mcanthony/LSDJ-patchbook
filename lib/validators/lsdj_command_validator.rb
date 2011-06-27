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
  end
end
