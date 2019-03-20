Hash.class_eval do

  def dig_for_array(*path)
    (v = self.dig(*path)).is_a?(Array) ? v : nil
  end

  def dig_for_boolean(*path)
    (v = self.dig(*path)).to_s.upcase.eql?("TRUE") ? true : nil
  end

  def dig_for_datetime(*path)
    self.dig(*path).to_datetime rescue nil
  end

  def dig_for_decimal(*path)
    (v = self.dig(*path).to_f) != 0.0 ? v : nil
  end

  def dig_for_hash(*path)
    (v = self.dig(*path)).is_a?(Hash) ? v : nil
  end

  def dig_for_integer(*path)
    (v = self.dig(*path).to_i) != 0 ? v : nil
  end

  def dig_for_string(*path)
    (v = self.dig(*path)).to_s.present? ? (v.eql?("0") ? nil : v) : nil
  end

end
