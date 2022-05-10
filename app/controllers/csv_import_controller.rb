class CsvImportController < ApplicationController
  before_action :authenticate_user!

  def index
    # @csv_imports = CsvImport.where(user_id: current_user.id)
  end

  def new
    @csv_import = CsvImport.new
  end

  def create
    @csv_import = current_user.user.build(csv_import_params)
  end

  def import
    file_path_to_save_to = './tmp/' + params[:file].original_filename
    File.write(file_path_to_save_to, params[:file].read)

    ImportCsvFileJob.perform_later(file_path_to_save_to, params[:file].original_filename, current_user)

    redirect_to contacts_path, notice: "CSV imported successfully"
  end

  private
  def csv_import_params
    params.require(:csv_import).permit(:status, :user_id)
  end

end
