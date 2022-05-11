class ImportCsvFileJob < ApplicationJob
  queue_as :default

  def perform(file_path_to_save_to, original_filename, current_user)
    CsvImport.create!(user_id: current_user.id, filename: original_filename)
    CSV.foreach(file_path_to_save_to, headers: true) do |row|
      CsvImport.update(status: 'processing')
      csv_hash = row.to_hash
      csv_hash['user_id'] = current_user.id
      if Contact.create!(csv_hash)
        CsvImport.update(status: 'finished')
      else
        CsvImport.update(status: 'failed')
      end
    end
    File.delete(file_path_to_save_to)
  end
end
