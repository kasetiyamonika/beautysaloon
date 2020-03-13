<% if defined?(Devise) %>
<% unless user_signed_in? %>
  <li class="dropdown">
    <a href="" class="dropdown-toggle" data-toggle="dropdown">Account <b class="caret"></b></a>
    <ul class="dropdown-menu">
      <li><%= link_to "Edit Account", edit_user_registration_path %></li>
      <li class="divider"></li>
      <li class="btn btn-primary"><%= link_to('Sign out', destroy_user_session_path, method: :delete) %></li>
    </ul>
  </li>
  <% else %>
  <li><%= link_to "Login", new_user_session_path %></li>
  <li><%= link_to "Sign Up", new_user_registration_path %></li>
    <% end %>
<% end %>




<ul class="nav navbar-nav navbar-right">
  <% if defined?(Devise) %>
    <% if user_signed_in? %>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><h3>Account</h3></a>
        <ul class="dropdown-menu">
          <li><%= link_to "Edit Profile", edit_user_registration_path %></li>
          <li class="divider"></li>
          <li><%= link_to "Sign Out", destroy_user_session_path, method: :delete %></li>
        </ul>
      </li>
    <% else %>
    <div class="col-md-12 text-center">
      <div class="row">
        <p class=" col-md-12">
          <button class="btn btn-outline-primary"><%= link_to "Sign In", new_user_session_path %></button>
        </p>
          <br>
        <p class=" col-md-12">
          <button class="btn btn-outline-primary"><%= link_to "Sign Up", new_user_registration_path %></button>
        </p>
      </div>
    </div>
    <% end %>
  <% end %>
</ul>




<!-- <% unless user_signed_in? %>
  <li><a href="/users/sign_in" class="btn nav-link btn-primary">Sign In</a></li>
<% else %>
<li><h5><%= current_user.email %></h5></li>
  <li class="btn btn-primary"><%= link_to('Sign out', destroy_user_session_path, method: :delete) %></li>
  <% end %> -->
