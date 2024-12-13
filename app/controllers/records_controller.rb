class RecordsController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = current_user.records
  end

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.build(record_params)
    if @record.save
      redirect_to records_path, notice: 'Record created successfully.'
    else
      render :new
    end
  end

  private

  def record_params
    params.require(:record).permit(:name, :description)
  end
end
