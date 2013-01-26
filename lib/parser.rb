module Parser
  class Numeric
    def self.delete_non_numeric(non_numeric)
      return non_numeric.to_s.gsub(/[^0-9]/s, '')
    end
  end
end
