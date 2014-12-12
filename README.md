Techie History Alltime Apple products
=====================================
Home: [http://localhost:3000](http://localhost:3000)

Blog: [http://localhost:3000/blog/post](http://localhost:3000/blog/post)

Sample: [http://localhost:3000/home/sample](http://localhost:3000/home/sample)

Admin: [http://localhost:3000/admin/](http://localhost:3000/admin/)


Goal:

Setup a simple blogging system for multiple authors

Users can login to manage their posts

Posts can belong to more than one category

Posts can be entered early but only show up the publish date

Homepage - Show all posts

Each post's categories link to a page showing only posts in that category

User's page - shows posts only from that user

# How to run this project on Windows x64

1. Install MySQL by installing [Xampp](https://www.apachefriends.org/index.html)
2. Install Rails
  1. Install [RailsFTW](http://railsftw.bryanbibat.net/)
  2. Install [DevKit](https://github.com/oneclick/rubyinstaller/downloads/)
    * Extract DevKit to a folder (like C:\DevKit")
    * Open Command prompt at C:\DevKit then `ruby dk.rb init` and `ruby dk.rb install`
    * Test your environment `ruby -v` and `rails -v`
3. Clone this repository to some where like Desktop\AIW2014
4. Open your Gem file and remove the line `gem 'mysql2'` ---> Save
5. Run `bundle install` and `bundle update`
  1. If you have any problem with SSL cetificate failed
    * Download this [cacert.pem](http://curl.haxx.se/ca/cacert.pem) and put it to `C:\RailsFTW418215\` might be `C:\RailsFTWxxxxxx\` depend on your version.
    * Run `set SSL_CERT_FILE=C:\RailsFTW418215\cacert.pem` in your Command Prompt
  2. Else you have no error with SSL certificate
    * Run `gem install mysql2 -- '--with-mysql-lib="C:\xampp\mysql\lib" --with-mysql-include="C:\xampp\mysql\include"' ` in your Command Prompt depend on your Xampp Install Location
6. re-Open your Gem file and add the line `gem 'mysql2'` ---> Save
7. Create your database: `bundle exec rake db:create` then migrate `bundle exec rake db:migrate`
8. Run the server `rails s`
9. Test your website `localhost:3000`
