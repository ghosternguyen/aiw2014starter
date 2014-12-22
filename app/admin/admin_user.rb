ActiveAdmin.register AdminUser do
  menu label: 'Quản Lý Người Dùng'
  permit_params :email, :password, :password_confirmation

  index :title => 'Quản Lý Người Dùng' do
    selectable_column
    id_column
    column 'Email', :email
    column 'Đăng Nhập Lần Cuối', :current_sign_in_at
    column 'Số Lần Đăng Nhập', :sign_in_count
    column 'Thời gian tạo', :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Thông tin Quản trị" do
      f.input :email
      f.input :password, :label => 'Mật Khẩu'
      f.input :password_confirmation, :label => 'Nhập Lại Mật Khẩu'
    end
    f.actions
  end

end
