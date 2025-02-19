Ecommerce

1. copy the .env.example file  to .env and change the db connection

    cp .env.example .env

    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=ecommerce
    DB_USERNAME=root
    DB_PASSWORD=1234567890

2. php artisan key:generate

3. Install Dependencies
    composer install

4. Run Migrations
   php artisan migrate

5. Seeding database
   php artisan db:seed

6. import the postman collection file into postman for checking API
    ecommerce.postman_collection.json

7. Below are the API listed in the project  

   Register
   Login
   Logout
   Products
   CreateProducts
   UpdateProducts
   Showproducts
   DeleteProducts
   Cart
   addtocart
   Updatecart
   Deletefromcart
   Checkout
   Orders

8. Database backup file is added
    ecommerce.sql