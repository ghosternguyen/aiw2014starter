ActiveAdmin.register Slide do
  menu :parent => "Manage Main Slide"
  permit_params :title, :photo

  index do
    selectable_column
    column :title, :sortable => :title do |slide|
      link_to slide.title, [ :admin, slide]
    end
    column :created_at
    column :updated_at 
    actions
  end

  show do |post|
    attributes_table do
      row :title
      row :photo do
        image_tag(post.photo.url(:thumb))
      end
    end
  end

  form :html => {:multipart => true} do |f|
    f.inputs "Add/Edit Slide" do
      f.input :title, required: true
      f.input :photo, :as => :file, :hint => f.object.photo.present? \
      ? f.template.image_tag(f.object.photo.url(:thumb))
      : f.template.content_tag(:span, "No Image yet")
    end
    f.actions
  end


end
