ActiveAdmin.register Post, :as => "All Product" do
  menu :parent => "Quản lý Chung", :label => "Quản lý Sản Phẩm"

  permit_params :category_id, :title, :body, :description, :image

  index :title => 'Sản Phẩm' do
    selectable_column
    column 'Strength ID', :id
    column 'Tên Sản Phẩm', :title, :sortable => :title do |post|
      link_to post.title, [ :admin, post] if post.title.present? 
    end
    column 'Tên Danh Mục', :category do |post|
      link_to post.category.name, [ :admin, post]
    end
    column 'Thời gian tạo', :created_at
    column 'Thời gian cập nhật', :updated_at 
    actions
  end 

  show do |post|
    attributes_table do
      row('Sản Phẩm') { post.title }
      row('Danh Mục') do
        post.category.name
      end
      row 'Nội Dung', :body do
        raw post.body
      end
      row 'Hình Ảnh', :image do
        image_tag(post.image.url(:thumb))
      end
    end
  end 

  form :html => {:multipart => true} do |f|
    f.inputs "Thêm/Sửa Sản Phẩm" do
      f.input :category_id, :as => :select, :collection => Category.all, :label => "Danh Mục"
      f.input :title, required: true, :label => "Sản Phẩm"
      f.input :body, required: true, :as => :ckeditor, :label => "Nội Dung"
      f.input :image, :as => :file, :label => "Hình Ảnh", :hint => f.object.image.present? \
      ? f.template.image_tag(f.object.image.url(:thumb))
      : f.template.content_tag(:span, "Chưa có ảnh")
      f.input :image_cache, :as => :hidden
      f.input :description, :label => "Miêu Tả"
    end
    f.actions
  end
end
