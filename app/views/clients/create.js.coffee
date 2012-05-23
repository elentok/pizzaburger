<% if @client.errors.any? %>
  alert 'errors'
<% else %>
  alert 'success'
<% end %>
