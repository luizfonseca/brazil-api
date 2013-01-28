module Parser
  class Numeric
    def self.delete_non_numeric(non_numeric)
      non_numeric.to_s.gsub(/[^0-9]/) { "" }
    end
  end
end
