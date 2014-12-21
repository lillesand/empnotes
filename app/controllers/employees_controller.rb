class EmployeesController < ApplicationController

  def index
  end

  def new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save

    redirect_to @employee
  end

  def list
  end

  def show
    @employee = Employee.find(params[:id])
  end

  private
  def employee_params
    params[:employee].permit(:bekk_id, :name)
  end
end
