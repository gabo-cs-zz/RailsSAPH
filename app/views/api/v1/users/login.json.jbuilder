json.status :ok
json.message 'logged in successfully'
json.data do
  json.extract! @user, :id, :role_vp, :gender_vp, :cc, :name, :address, :email, :phone_number, :date_of_birth, :api_token
end
