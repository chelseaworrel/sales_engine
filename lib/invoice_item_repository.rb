require 'csv'
require_relative 'invoice_item'


class InvoiceItemRepository
  attr_reader :invoice_items, :sales_engine

  def initialize(sales_engine)
    @invoice_items = []
    @sales_engine = sales_engine
  end

  def load_data(path)
    file = CSV.open(path, headers: true, header_converters: :symbol)
    file.map do |line|
      @invoice_items << InvoiceItem.new(line, self)
    end
    file.close
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.sample
  end

  def find_by_id(id)
    @invoice_items.find do |invoice_item|
       invoice_item.id == id
    end
  end

  def find_by_item_id(item_id)
    @invoice_items.find do |invoice_item|
       invoice_item.item_id == item_id
    end
  end

  def find_by_invoice_id(invoice_id)
    @invoice_items.find do |invoice_item|
       invoice_item.invoice_id == invoice_id
    end
  end

  def find_by_quantity(quantity)
    @invoice_items.find do |invoice_item|
       invoice_item.quantity == quantity
    end
  end

  def find_by_unit_price(unit_price)
    @invoice_items.find do |invoice_item|
       invoice_item.unit_price == unit_price
    end
  end

  def find_by_created_at(created_at)
    @invoice_items.find do |invoice_item|
       invoice_item.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    @invoice_items.find do |invoice_item|
       invoice_item.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    @invoice_items.find_all do |invoice_item|
      invoice_item.id == id
    end
  end

  def find_all_by_item_id(item_id)
    @invoice_items.find_all do |invoice_item|
       invoice_item.item_id == item_id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    @invoice_items.find_all do |invoice_item|
      invoice_item.invoice_id == invoice_id
    end
  end

  def find_all_by_quantity(quantity)
    @invoice_items.find_all do |invoice_item|
      invoice_item.quantity == quantity
    end
  end

  def find_all_by_unit_price(unit_price)
    @invoice_items.find_all do |invoice_item|
      invoice_item.unit_price == unit_price
    end
  end

  def find_all_by_created_at(created_at)
    @invoice_items.find_all do |invoice_item|
      invoice_item.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    @invoice_items.find_all do |invoice_item|
      invoice_item.updated_at == updated_at
    end
  end
end
