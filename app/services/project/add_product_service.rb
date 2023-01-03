
class Project::AddProductService
  attr_reader :requested_quantity, :stock_item, :params, :orderable
  def self.run(orderable, params, product)
    new(orderable, params, product).run
  end
  
  def initialize(orderable, params, product)
    @orderable = orderable
    @product = product
    @params = params
    @requested_quantity = params[:quantity].to_i
    @stock_item = @product.stock_item
  end
  
  def run 
    if stock_available?
      ActiveRecord::Base.transaction do
        stock_item.increment!(:quantity_available, quantity_change)
        orderable.update(params)
      end
    end
  end

  def quantity_change
    (orderable.quantity || 0) - requested_quantity
  end
  
  def stock_available?
    stock_item.quantity_available + quantity_change >= 0
  end
end
