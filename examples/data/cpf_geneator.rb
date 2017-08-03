require 'cpf_cnpj'
require 'faker'

module CPFGenerator
  def self.generate(n, output, formatted = true)
    file = File.open(output, 'w')
    n.times do 
      file.puts [ 
        Faker::Name.first_name, 
        Faker::Name.last_name,  
        CPF.generate(formatted) 
      ].join(',')
    end
    file.close
  end
end

