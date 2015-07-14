get "/api_assignments" do
  all =  Assignment.all_as_hash
  
  json all
end

get "/api_list" do
  erb :"api/api_list"
end

get "/api_assign_list/:id" do
  assignment = Assignment.find_as_hash(params["id"])
  partner = Partner.find_as_hash(params["id"])
  link = Link.find_as_hash(params["id"])
  
  json [assignment, partner, link]
end

get "/api_all_links" do
  all_link = Link.all_as_hash
  
  json all_link
end

get "/api_all_partners" do
  all_partner = Partner.all_as_hash
  
  json all_partner
end

get "/api_partner_form" do
  erb :"api/api_partner_form"
end

#Not working and not sure why
get "/api_partner_assign/:x" do
  search_partner = Partner.search_rows_hash(partner, params["x"])  
  find_assign = Assignment.find_rows_hash(id, search_partner[assignment_id])
  
  json find_assign
end

get "/api_add_assign" do
  
end

get "/api_update_link" do
  
end

get "/api_update_partner" do
  
end

get "/api_delete_assign_list" do
  erb :"api_delete_assign_list"
end

get "api_delete_assign/:x" do
  a = Assignment.new("id" => params["x"].to_i)
  a.delete
  
  json a
end

get "/api_delete_link_list" do
  erb :"api_delete_link_list"
end

get "api_delete_link/:x" do
  l = Link.new("id" => params["x"].to_i)
  l.delete
  
  json l
end

get "/api_delete_partner_list" do
  erb :"api_delete_partner_list"
end

get "api_delete_partner/:x" do
  p = Partner.new("id" => params["x"].to_i)
  p.delete
  
  json p
end



