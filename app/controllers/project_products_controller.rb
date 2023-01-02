class ProjectProductsController < ApplicationController

    def create
      @project = Project.find(params[:project_id])
      @product = Product.find(project_product_params[:product_id])
      @orderable = Orderable.new(project_product_params)
      @orderable.project = @project
      if @orderable.save
        flash[:notice] = "Product has been added to Project"
        redirect_to project_path(@project)
      else
        flash[:notice] = "Product has not been added to Project"
        redirect_to project_path(@project)
      end
    end

    def destroy
      @orderable = Orderable.find(params[:orderable_id])
      @orderable.destroy
      redirect_to project_path(params[:project_id])
    end
    private

    def project_product_params
      params.require(:orderable).permit(:product_id, :quantity)
    end
end