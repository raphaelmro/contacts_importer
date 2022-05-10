class ImportCsvFileJob < ApplicationJob
  queue_as :default

  def perform(file_path_to_save_to, original_filename, current_user)
    CsvImport.create!(user_id: current_user.id, filename: original_filename)
    CSV.foreach(file_path_to_save_to, headers: true) do |row|
      csv_hash = row.to_hash
      csv_hash['user_id'] = current_user.id
      Contact.create!(csv_hash)
    end
  end
end
