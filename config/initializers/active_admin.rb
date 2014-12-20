ActiveAdmin.setup do |config|

  config.site_title = "Techie History Alltime Apple Products"

  config.site_title_image = 'logo-apple.png'

  config.namespace :admin do |admin|
    admin.build_menu :utility_navigation do |menu|
      menu.add label: "GhoSter..,Inc", url: "http://www.thinghost.co.vu", html_options: { target: :blank }
      admin.add_current_user_to_menu  menu
      admin.add_logout_button_to_menu menu
    end
    admin.site_title = "Admin SiteArea"
    admin.site_title_image = 'logo-apple.png'
  end


  config.authentication_method = :authenticate_admin_user!

  config.current_user_method = :current_admin_user

  config.logout_link_path = :destroy_admin_user_session_path

  config.batch_actions = true

  config.register_javascript 'ckeditor/init.js'

end

ActiveAdmin.register Post do
  permit_params :title, :body, :photo
end
