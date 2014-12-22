ActiveAdmin.register Slide do
  menu :parent => "Quản Lý Trình Show Ảnh", :label => 'Các Slide Ảnh'
  permit_params :title, :photo

  index :title => 'Slide Trình Diễn' do
    selectable_column
    column 'Tên Hiển Thị', :title, :sortable => :title do |slide|
      link_to slide.title, [ :admin, slide]
    end
    column 'Thời gian tạo', :created_at
    column 'Thời gian cập nhật', :updated_at 
    actions
  end

  show do |slide|
    attributes_table do
      row('Sản Phẩm') { slide.title }
      row 'Hình Ảnh', :photo do
        image_tag(slide.photo.url(:thumb))
      end
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs "Thêm/Sửa Slide" do
      f.input :title, required: true, :label => "Tên Hiển Thị"
      f.input :photo, :as => :file, :label => "Hình Ảnh", :hint => f.object.photo.present? \
      ? f.template.image_tag(f.object.photo.url(:thumb))
      : f.template.content_tag(:span, "No Image yet")
    end
    f.actions
  end


end
