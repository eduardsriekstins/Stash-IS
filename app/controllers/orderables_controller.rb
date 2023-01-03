class OrderablesController < ApplicationController

    def create
      @project = Project.find(params[:project_id])
      @product = Product.find(orderable_params[:product_id])
      @orderable = Orderable.new
      if Project::AddProductService.run(@orderable, orderable_params, @product)
        flash[:notice] = "Product has been added to Project"
        redirect_to project_path(@project)
      else
        flash[:alert] = "There might not be enough Products, so Product has not been added to Project"
        redirect_to project_path(@project)
      end
    end

    def edit
      @orderable = Orderable.find(params[:id])
    end

    def update
      @orderable = Orderable.find(params[:id])
      @product = @orderable.product
      respond_to do |format|
        if Project::AddProductService.run(@orderable, orderable_params, @product)
          format.html { redirect_to project_url(@orderable.project), notice: "Project Product has been updated!" }
        else 
          format.html { redirect_to project_url(@orderable.project), alert: "There might not be enough Products, so Product has not been added to Project!" }
        end
      end
    end

    def destroy
      @orderable = Orderable.find(params[:id])
      project = @orderable.project
      @orderable.destroy
      redirect_to project_path(project), alert: "Product has been deleted and it's quantity will need to be added to Products!"
    end
    private

    def orderable_params
      params.require(:orderable).permit(:product_id, :quantity, :project_id)
    end
end