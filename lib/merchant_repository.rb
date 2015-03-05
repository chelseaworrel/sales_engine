require 'csv'
require_relative 'merchant'


class MerchantRepository
  attr_reader :merchants, :sales_engine

  def initialize(sales_engine)
    @merchants = []
    @sales_engine = sales_engine
  end

  def load_data(path)
    file = CSV.open(path, headers: true, header_converters: :symbol)
    file.map do |line|
      @merchants << Merchant.new(line, self)
    end
    file.close
  end

  def all
    @merchants
  end

  def random
    @merchants.sample
  end

  def find_by_id(id)
    @merchants.find do |merchant|
       merchant.id == id
    end
  end

  def find_by_name(name)
    @merchants.find do |merchant|
       merchant.name.downcase == name.downcase
    end
  end

  def find_by_created_at(created_at)
    @merchants.find do |merchant|
       merchant.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    @merchants.find do |merchant|
       merchant.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    @merchants.find_all do |merchant|
      merchant.id == id
    end
  end

  def find_all_by_name(name)
    @merchants.find_all do |merchant|
      merchant.name.downcase == name.downcase
    end
  end

  def find_all_by_created_at(created_at)
    @merchants.find_all do |merchant|
      merchant.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    @merchants.find_all do |merchant|
      merchant.updated_at == updated_at
    end
  end
end
