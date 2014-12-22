ActiveAdmin.register News do
  menu :parent => "Quản lý Chung", :label => "Quản lý Tin Tức"

  permit_params :title, :content, :credit, :image

  index :title => 'Tin Tức' do
    selectable_column
    column 'Tên Tin Tức', :title, :sortable => :title do |news|
      link_to news.title, [ :admin, news]
    end
    column 'Thời gian tạo', :created_at
    column 'Thời gian cập nhật', :updated_at 
    actions
  end

  show do |news|
    attributes_table do
      row('Tin Tức') { news.title }
      row 'Nội Dung', :content do
        raw news.content
      end
      row 'Hình Ảnh', :image do
        image_tag(news.image.url(:thumb))
      end
      row 'Tác Giả', :credit
    end
  end 

  form(:html => { :multipart => true }) do |f|
    f.inputs "Thêm/Sửa Tin Tức" do
      f.input :title, :label => "Tin Tức"
      f.input :content, :as => :ckeditor, :label => "Nội Dung"
      f.input :credit, :label => "Tác Giả"
      f.input :image, :as => :file, :label => "Hình Ảnh", :hint => f.object.image.present? \
        ? f.template.image_tag(f.object.image.url(:thumb))
        : f.template.content_tag(:span, "Chưa có ảnh")
      f.input :image_cache, :as => :hidden
     end
    f.actions
  end

end
