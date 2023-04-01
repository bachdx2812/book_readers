return if User.exists?

ActiveRecord::Base.connection.truncate_tables(:users)

User.create!(
  email: "test@gmail.com",
  password: "12345678"
)