[1mdiff --git a/app/controllers/public/users_controller.rb b/app/controllers/public/users_controller.rb[m
[1mindex 65cb2e8..2eeea68 100644[m
[1m--- a/app/controllers/public/users_controller.rb[m
[1m+++ b/app/controllers/public/users_controller.rb[m
[36m@@ -33,7 +33,7 @@[m [mclass Public::UsersController < ApplicationController[m
 [m
   private[m
 [m
[31m-   def set_user[m
[32m+[m[32m  def set_user[m
     @user = User.find(params[:id])[m
   end[m
 [m
[36m@@ -46,3 +46,5 @@[m [mclass Public::UsersController < ApplicationController[m
   end[m
 [m
 end[m
[41m+[m
[41m+[m
[1mdiff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb[m
[1mindex bc9b2c7..b4bf2b4 100644[m
[1m--- a/app/views/layouts/application.html.erb[m
[1m+++ b/app/views/layouts/application.html.erb[m
[36m@@ -14,59 +14,59 @@[m
   <body>[m
   <div class="container-field", style="background-color: #EFEFEF;">[m
 [m
[31m-    <div class="row py-3"></div>[m
[32m+[m[32m      <div class="row py-3"></div>[m
 [m
[31m-    <header class="d-flex justify-content-center align-items-center", style="background-color: white; height: 60px; color: #545454;">[m
[32m+[m[32m      <header class="d-flex justify-content-center align-items-center", style="background-color: white; height: 60px; color: #545454;">[m
 [m
[31m-    <div class="logo pr-5">[m
[31m-      <%= link_to root_path, class: "logo" do %>[m
[31m-        <%= image_tag 'exercise.png', size: "55x55", alt: "icon" %>[m
[31m-      <% end %>[m
[31m-    </div>[m
[32m+[m[32m        <div class="logo pr-5">[m
[32m+[m[32m          <%= link_to root_path, class: "logo" do %>[m
[32m+[m[32m            <%= image_tag 'exercise.png', size: "55x55", alt: "icon" %>[m
[32m+[m[32m          <% end %>[m
[32m+[m[32m        </div>[m
 [m
[31m-      <ul class="list-unstyled d-flex ml-5">[m
[31m-        <% if user_signed_in? %>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'ホーム', posts_path, style: "color: #545454; font-weight: bold;" %>[m
[31m-          </li>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'コミュニティ', communities_path, style: "color: #545454; font-weight: bold;" %>[m
[31m-          </li>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'アバウト', about_path, style: "color: #545454; font-weight: bold;" %>[m
[31m-          </li>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'マイページ', user_path(current_user), style: "color: #545454; font-weight: bold;" %>[m
[31m-          </li>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'ログアウト',destroy_user_session_path, method: :delete, style: "color: #545454; font-weight: bold;"%>[m
[31m-          </li>[m
[32m+[m[32m        <ul class="list-unstyled d-flex ml-5">[m
[32m+[m[32m          <% if user_signed_in? %>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'ホーム', posts_path, style: "color: #545454; font-weight: bold;" %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'コミュニティ', communities_path, style: "color: #545454; font-weight: bold;" %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'アバウト', about_path, style: "color: #545454; font-weight: bold;" %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'マイページ', user_path(current_user), style: "color: #545454; font-weight: bold;" %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'ログアウト',destroy_user_session_path, method: :delete, style: "color: #545454; font-weight: bold;"%>[m
[32m+[m[32m            </li>[m
 [m
[31m-        <% else %>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'ホーム', posts_path, style: "color: #545454; font-weight: bold;" %>[m
[31m-          </li>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'コミュニティ', communities_path, style: "color: #545454; font-weight: bold;" %>[m
[31m-          </li>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to 'アバウト', about_path, style: "color: #545454; font-weight: bold;" %>[m
[31m-          </li>[m
[31m-          <li class="mx-5 mt-3">[m
[31m-            <%= link_to new_user_registration_path, style: "color: #545454; font-weight: bold;" do %>[m
[31m-              <i class="fa-solid fa-user-plus"></i> Sign up[m
[31m-            <% end %>[m
[31m-          </li>[m
[31m-          <li class="mr-5 mt-3">[m
[31m-            <%= link_to new_user_session_path, style: "color: #545454; font-weight: bold;" do %>[m
[31m-              <i class="fa-solid fa-right-to-bracket"></i> Log in[m
[31m-            <% end %>[m
[31m-          </li>[m
[31m-        <% end %>[m
[31m-      </ul>[m
[31m-    </header>[m
[32m+[m[32m          <% else %>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'ホーム', posts_path, style: "color: #545454; font-weight: bold;" %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'コミュニティ', communities_path, style: "color: #545454; font-weight: bold;" %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to 'アバウト', about_path, style: "color: #545454; font-weight: bold;" %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mx-5 mt-3">[m
[32m+[m[32m              <%= link_to new_user_registration_path, style: "color: #545454; font-weight: bold;" do %>[m
[32m+[m[32m                <i class="fa-solid fa-user-plus"></i> Sign up[m
[32m+[m[32m              <% end %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m            <li class="mr-5 mt-3">[m
[32m+[m[32m              <%= link_to new_user_session_path, style: "color: #545454; font-weight: bold;" do %>[m
[32m+[m[32m                <i class="fa-solid fa-right-to-bracket"></i> Log in[m
[32m+[m[32m              <% end %>[m
[32m+[m[32m            </li>[m
[32m+[m[32m          <% end %>[m
[32m+[m[32m        </ul>[m
[32m+[m[32m      </header>[m
 [m
[31m-    <%= yield %>[m
[32m+[m[32m      <%= yield %>[m
     </div>[m
     <footer>[m
 [m
[36m@@ -74,3 +74,4 @@[m
   </body>[m
 [m
 </html>[m
[41m+[m
