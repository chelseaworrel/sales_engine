Module SharedResponsibilities
#Refactor:
#find the duplicates and only put those methods in a module
#credit_card.transactions.all
# require 'the file location'
# Class the class you are using
# include WhateverTheHeckWeWant
# module WhateverTheHeckWeWant
#   nothing but methods in the module
# # def find_by_id(id, data_type)
#   data_type.find do |datum|
#      datum.id == id
#   end
# end

  def all(data_type)
    data_type
  end

  def random(data_type)
    data_type.sample
  end

  def find_by_id(id, data_type)
    data_type.detect do |datum|
       datum.id == id
    end
  end

  # def load_data(path)
  #   file = CSV.open(path, headers: true, header_converters: :symbol)
  #   file.map do |line|
  #     customers << Customer.new(line, self)
  #   end
  #   file.close
  # end
end
