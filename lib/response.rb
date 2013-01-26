class Response
  def self.data(parameters)
    response = []
    parameters.each do |k,v|
      case k.to_sym
        when :email
          response << Validator::Email.new(v).instance_eval { as_json }
        when :cep
          response << Validator::Cep.new(v).instance_eval { as_json }
        when :cpf
          response << Validator::Cpf.new(v).instance_eval { as_json }
      end
    end
    return response
  end
end
