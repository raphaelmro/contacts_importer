class CsvImportController < ApplicationController
  before_action :authenticate_user!
  before_action :set_csv_import, only: [:update]

  def index
    @csv_imports = CsvImport.where(user_id: current_user.id)
  end

  def new
    @csv_import = CsvImport.new
  end

  def create
    @csv_import = current_user.user.build(csv_import_params)
  end

  def update
    @csv_import.update(csv_import_params)
  end

  def import
    if params[:file].nil?
      redirect_to new_csv_import_path, alert: "Please choose a file to import"
    else
      file_path_to_save_to = './tmp/' + params[:file].original_filename
      File.write(file_path_to_save_to, params[:file].read)
      ImportCsvFileJob.perform_later(file_path_to_save_to, params[:file].original_filename, current_user)
      redirect_to contacts_path, notice: "CSV imported successfully"
    end
  end

  private
  def set_csv_import
    @csv_import = CsvImport.find(params[:id])
  end

  def csv_import_params
    params.require(:csv_import).permit(:filename, :status, :user_id)
  end

end
