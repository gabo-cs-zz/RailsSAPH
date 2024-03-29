json.status :ok
json.message 'success'
json.data do
  json.array! @hqs do |hq|
    json.extract! hq, :id
    json.user do
      json.extract! hq.user, :id, :role_vp, :gender_vp, :cc, :name, :address, :email, :phone_number, :date_of_birth
    end
    json.extract! hq, :city_vp, :name, :address, :photo_url
  end
end
