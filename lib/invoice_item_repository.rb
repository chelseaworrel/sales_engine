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
      invoice_items << InvoiceItem.new(line, self)
    end
    file.close
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def find_by_id(id)
    invoice_items.detect do |invoice_item|
       invoice_item.id == id
    end
  end

  def find_by_item_id(item_id)
    invoice_items.detect do |invoice_item|
       invoice_item.item_id == item_id
    end
  end

  def find_by_invoice_id(invoice_id)
    invoice_items.detect do |invoice_item|
       invoice_item.invoice_id == invoice_id
    end
  end

  def find_by_quantity(quantity)
    invoice_items.detect do |invoice_item|
       invoice_item.quantity == quantity
    end
  end

  def find_by_unit_price(unit_price)
    invoice_items.detect do |invoice_item|
       invoice_item.unit_price == unit_price
    end
  end

  def find_by_created_at(created_at)
    invoice_items.detect do |invoice_item|
       invoice_item.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    invoice_items.detect do |invoice_item|
       invoice_item.updated_at == updated_at
    end
  end

  def find_all_by_id(id)
    invoice_items.select do |invoice_item|
      invoice_item.id == id
    end
  end

  def find_all_by_item_id(item_id)
    invoice_items.select do |invoice_item|
       invoice_item.item_id == item_id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    invoice_items.select do |invoice_item|
      invoice_item.invoice_id == invoice_id
    end
  end

  def find_all_by_quantity(quantity)
    invoice_items.select do |invoice_item|
      invoice_item.quantity == quantity
    end
  end

  def find_all_by_unit_price(unit_price)
    invoice_items.select do |invoice_item|
      invoice_item.unit_price == unit_price
    end
  end

  def find_all_by_created_at(created_at)
    invoice_items.select do |invoice_item|
      invoice_item.created_at == created_at
    end
  end

  def find_all_by_updated_at(updated_at)
    invoice_items.select do |invoice_item|
      invoice_item.updated_at == updated_at
    end
  end

  def find_invoice(id)
    sales_engine.find_invoice_by_id(id)
  end

  def find_item(item_id)
    sales_engine.find_item_by_id(item_id)
  end

  def create_new_items(items, id)
    items.each do |item|
      grouped_items = items.group_by do |item|
        item
      end
      quantity = grouped_items.map do |item|
        item.count
      end.uniq.flatten.join
      line = {
        id:         "#{invoice_items.last.id + 1}",
        item_id:    item.id,
        invoice_id: id,
        quantity:   quantity,
        unit_price: item.unit_price,
        created_at: "#{Date.new}",
        updated_at: "#{Date.new}"
              }
     new_invoice_item = InvoiceItem.new(line, self)
     invoice_items << new_invoice_item
    end
  end
end
