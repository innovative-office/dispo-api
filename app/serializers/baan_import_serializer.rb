class BaanImportSerializer < ActiveModel::Serializer
  attributes :id, :importing_date, :url, :baan_upload_file_name, :created_at
  
  def url
     "https://dispo-api-tzhbami7.c9users.io" + object.baan_upload.url
  end
end
