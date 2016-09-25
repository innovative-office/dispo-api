class BaanImport < ActiveRecord::Base
  has_attached_file :baan_upload
  validates_attachment :baan_upload, content_type: { content_type: ["application/csv", "text/csv", "application/vnd.ms-excel", "text/plain"] }
end