class CsvImportController < ApplicationController
  before_action :authenticate_user!

  def index
    @csv_imports = CsvImport.where(user_id: current_user.id)
  end

  def new
    @csv_import = CsvImport.new
  end

  def create
    @csv_import = current_user.user.build(csv_import_params)
  end

  def import
    CSV.foreach(params[:file], headers: true) do |row|
      csv_hash = row.to_hash
      csv_hash['user_id'] = current_user.id
      Contact.create!(csv_hash)
    end
    CsvImport.create!(user_id: current_user.id, filename: params[:file].original_filename)

    redirect_to contacts_path, notice: "CSV imported successfully"
  end

  private
  def csv_import_params
    params.require(:csv_import).permit(:status, :user_id)
  end

end
