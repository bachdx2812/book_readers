ActiveRecord::Base.connection.truncate_tables(:books)

1.upto(10) do |i|
  Book.create!(
    title: "title book number #{i}",
    author: "author of book #{i}",
    image_url: "https://afamilycdn.com/thumb_w/650/150157425591193600/2020/8/14/5bd607e0c0cb89afbe0d17eda2f628fc-15719007946641269292659-1597408958984187658156.png",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"
  )
end