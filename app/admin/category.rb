ActiveAdmin.register Category do
  menu :parent => "Quản lý Chung", :label => "Quản lý Danh Mục"
  permit_params :name

  index :title => 'Danh Mục' do
    selectable_column
    column 'Tên Danh Mục', :name, :sortable => :name do |category|
      link_to category.name, [ :admin, category]
    end
    column 'Thời gian tạo', :created_at
    column 'Thời gian cập nhật', :updated_at 
    actions
  end

  show do |category|
    attributes_table do
      row('Danh Mục') { category.name }
    end
  end 

  form(:html => { :multipart => true }) do |f|
    f.inputs "Thêm/Sửa Danh Mục" do
      f.input :name, :label => "Danh Mục"
     end
    f.actions
  end
end

