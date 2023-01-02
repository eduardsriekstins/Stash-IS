class OrderablesController < ApplicationController

    def create
      @project = Project.find(params[:project_id])
      @orderable = Orderable.new(orderable_params)
      if @orderable.save
        flash[:notice] = "Product has been added to Project"
        redirect_to project_path(@project)
      else
        flash[:notice] = "Product has not been added to Project"
        redirect_to project_path(@project)
      end
    end

    def edit
      @orderable = Orderable.find(params[:id])
    end

    def update
      @orderable = Orderable.find(params[:id])
      respond_to do |format|
        if @orderable.update(orderable_params)
          format.html { redirect_to project_url(@orderable.project), notice: "Project has been updated!" }
        else 
          format.html { redirect_to project_url(@orderable.project), alert: "Project has not been updated!" }
        end
      end
    end

    def destroy
      @orderable = Orderable.find(params[:id])
      project = @orderable.project
      @orderable.destroy
      redirect_to project_path(project)
    end
    private

    def orderable_params
      params.require(:orderable).permit(:product_id, :quantity, :project_id)
    end
end