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
      merchants << Merchant.new(line, self)
    end
    file.close
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_by_id(id)
    merchants.detect do |merchant|
       merchant.id == id
    end
  end

  def find_by_name(name)
    merchants.detect do |merchant|
       merchant.name.downcase == name.downcase
    end
  end

  def find_by_created_at(created_at)
    merchants.detect do |merchant|
       merchant.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    merchants.detect do |merchant|
       merchant.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    merchants.select do |merchant|
      merchant.id == id
    end
  end

  def find_all_by_name(name)
    merchants.select do |merchant|
      merchant.name.downcase == name.downcase
    end
  end

  def find_all_by_created_at(created_at)
    merchants.select do |merchant|
      merchant.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    merchants.select do |merchant|
      merchant.updated_at == updated_at
    end
  end

  def find_items(id)
    sales_engine.find_items_by_merchant_id(id)
  end

  def find_invoices(id)
    sales_engine.find_invoices_by_merchant_id(id)
  end

  def most_revenue(x)

  end
end
