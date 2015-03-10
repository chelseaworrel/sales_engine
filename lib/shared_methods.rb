module SharedDuties
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

  def find_by_created_at(created_at, data_type)
    data_type.detect do |datum|
      datum.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at, data_type)
    data_type.detect do |datum|
      datum.updated_at == updated_at
    end
  end


  def find_all_by_id(id, data_type)
    data_type.select do |datum|
      datum.id == id
    end
  end

  def find_all_by_created_at(created_at, data_type)
    data_type.select do |datum|
      datum.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at, data_type)
    data_type.select do |datum|
      datum.updated_at == updated_at
    end
  end
end
