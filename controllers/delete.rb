get "/delete_menu" do
  erb :"main/delete_menu"
end

get "/delete_assignment_list/:x" do
  erb :"delete/delete_assignment_list"
end

get "/delete_assignment/:x" do
  @d = Assignment.new("id" => params["x"].to_i)
  @d.delete
  return "Success!"
end

get "/delete_partner_list/:x" do
  erb :"delete/delete_partner_list"
end

get "/delete_partner/:x" do
  @d = Partner.new("id" => params["x"].to_i)
  @d.delete
  return "Success!"
end

get "/delete_link_list/:x" do
  erb :"delete/delete_link_list"
end

get "/delete_link/:x" do
  @d = Link.new("id" => params["x"].to_i)
  @d.delete
  return "Success!"
end