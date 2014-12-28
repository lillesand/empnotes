class NotesController < ApplicationController

  def create
    @employee = Employee.find(params[:employee_id])
    puts params.permit(:added_at, :note)
    @employee.notes.create(params[:note].permit(:added_at, :note, :happiness))
    redirect_to employee_path(@employee)
  end

end
