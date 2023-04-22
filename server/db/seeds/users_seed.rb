ActiveRecord::Base.connection.truncate_tables(:users)

1.upto(10) do |i|
  User.create!(
    email: "user_#{i}@gmail.com",
    password: "12345678"
  )
end