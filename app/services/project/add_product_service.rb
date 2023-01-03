module Project
  class AddProductService
    attr_reader :requested_quantity, :stock_item, :params

    def self.run(project, params)
      new(project, params).run
    end
  
    def initialize(project, params)
      @project = project
      @params = params
      @requested_quantity = params[:quantity]
      @stock_item = StockItem.find(product_id: params[:product_id])
    end
  
    def run
      orderable = Orderable.new(params)  
        if stock_available?
          stock_item.quantity_available = stock_item.quantity_available - params[:quantity]

          ActiveRecord::Base.transaction do
            stock_item.save
            orderable.save
          end
        end
      end
  
      def stock_available?
        stock_item.quantity_available - requested_quantity >= 0
      end
    end
  end