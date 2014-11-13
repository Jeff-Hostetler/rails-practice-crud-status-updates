class StatusesController < ApplicationController

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(params.require(:status).permit(:status, :user, :likes))
    if @status.save
      redirect_to @status, notice: "Successfully statused"
    else
      render :new
    end
  end

  def show
    @status = Status.find(params[:id])
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(params.require(:status).permit(:status, :user, :likes))
      redirect_to @status, notice: "Successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.delete
    redirect_to statuses_path, notice: "Totes deleted, yo"
  end
end
