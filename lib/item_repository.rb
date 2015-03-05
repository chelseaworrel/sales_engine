require 'csv'
require_relative 'item'


class ItemRepository
  attr_reader :items, :sales_engine

  def initialize(sales_engine)
    @items = []
    @sales_engine = sales_engine
  end

  def load_data(path)
    file = CSV.open(path, headers: true, header_converters: :symbol)
    file.map do |line|
      @items << Item.new(line, self)
    end
    file.close
  end

  def all
    @items
  end

  def random
    @items.sample
  end

  def find_by_id(id)
    @items.find do |item|
       item.id == id
    end
  end

  def find_by_name(name)
    @items.find do |item|
       item.name.downcase == name.downcase
    end
  end

  def find_by_description(description)
    @items.find do |item|
       item.description.downcase == description.downcase
    end
  end

  def find_by_unit_price(unit_price)
    @items.find do |item|
       item.unit_price == unit_price
    end
  end

  def find_by_merchant_id(merchant_id)
    @items.find do |item|
       item.merchant_id == merchant_id
    end
  end

  def find_by_created_at(created_at)
    @items.find do |item|
       item.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    @items.find do |item|
       item.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    @items.find_all do |item|
      item.id == id
    end
  end

  def find_all_by_name(name)
    @items.find_all do |item|
      item.name.downcase == name.downcase
    end
  end

  def find_all_by_description(description)
    @items.find_all do |item|
      item.description.downcase == description.downcase
    end
  end

  def find_all_by_unit_price(unit_price)
    @items.find_all do |item|
      item.unit_price == unit_price
    end
  end

  def find_all_by_merchant_id(merchant_id)
    @items.find_all do |item|
      item.merchant_id == merchant_id
    end
  end

  def find_all_by_created_at(created_at)
    @items.find_all do |item|
      item.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    @items.find_all do |item|
      item.updated_at == updated_at
    end
  end
end
