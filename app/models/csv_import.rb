class CsvImport < ApplicationRecord
  belongs_to :user
  attribute :status, :string, default: "on_hold"
  enum status: { on_hold: "on_hold" , processing: "processing",
                 failed: "failed" , finished: "finished" }, _default: "on_hold"
end
