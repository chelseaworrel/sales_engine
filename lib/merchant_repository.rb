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
    find_by_attribute(:id, id)
  end

  def find_by_name(name)
    find_by_attribute(:name, name)
  end

  def find_by_created_at(created_at)
    find_by_attribute(:created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_attribute(:updated_at, updated_at)
  end

  def find_all_by_id(id)
    find_all_by_attribute(:id, id)
  end

  def find_all_by_name(name)
    find_all_by_attribute(:name, name)
  end

  def find_all_by_created_at(created_at)
    find_all_by_attribute(:created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_attribute(:updated_at, updated_at)
  end

  def find_items(id)
    sales_engine.find_items_by_merchant_id(id)
  end

  def find_invoices(id)
    sales_engine.find_invoices_by_merchant_id(id)
  end

  def most_revenue(x)
    merchants.sort_by do |merchant|
      merchant.revenue
    end.reverse.first(x)
  end

  def most_items(x)
    merchants.sort_by do |merchant|
      merchant.quantity_successful_items
    end.reverse.first(x)
  end

  def revenue(date)
    revenues = merchants.map do |merchant|
      merchant.revenue(date)
    end
    no_nil_revenues = revenues.select do |revenue|
      !revenue.nil?
    end
    no_nil_revenues.map { |rev| rev.to_d }.inject(:+)
  end

  private

  def find_by_attribute(attribute, given)
    merchants.detect { |merchant| merchant.send(attribute) == given }
  end

  def find_all_by_attribute(attribute, given)
    merchants.select { |merchant| merchant.send(attribute) == given }
  end
end
