ActiveAdmin.register News do
  menu :parent => "Manage Blog"

  permit_params :title, :content, :credit, :image

  index do
    selectable_column
    column :title, :sortable => :title do |news|
      link_to news.title, [ :admin, news]
    end
    column :created_at
    column :updated_at 
    actions
  end 
  show do |post|
    attributes_table do
      row :title
      row :content do
        raw post.content
      end
      row :image do
        image_tag(post.image.url(:thumb))
      end
      row :credit
    end
  end 

  form(:html => { :multipart => true }) do |f|
    f.inputs "Add/Edit News" do
      f.input :title
      f.input :content, :as => :ckeditor
      f.input :credit
      f.input :image, :as => :file, :hint => f.object.image.present? \
        ? f.template.image_tag(f.object.image.url(:thumb))
        : f.template.content_tag(:span, "No Image yet")
      f.input :image_cache, :as => :hidden
     end
    f.actions
  end

end
