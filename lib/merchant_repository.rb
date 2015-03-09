require 'csv'
require 'bigdecimal'
require 'bigdecimal/util'
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

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
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
    merchants.max_by.first(x) do |merchant|
      merchant.revenue
    end
  end

  def most_items(x)
    merchants.max_by.first(x) do |merchant|
      merchant.items.count
    end
  end

  def revenue(date)
    revenues = merchants.map do |merchant|
      merchant.revenue(date)
    end
    no_nil_revenues = revenues.select do |revenue|
      !revenue.nil?
    end
    no_nil_revenues.map { |rev| rev.to_d }.inject(:+).to_digits
  end
end
