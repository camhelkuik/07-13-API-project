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
  erb :"api/api_add_assign"
end

get "/api_save_assign" do
  new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"]})

  json new_entry
end

get "/api_update_link" do
  erb :"api/api_update_link_list"
end

get "/api_update_link_form/:x" do
  @entry = Link.find(params["x"].to_i)
  erb :"api/api_update_link_form"
end

get "/api_change_link/:x" do
  @entry = Link.find(params["x"].to_i)
  @entry.assignment_id = params["assignment_id"] 
  @entry.article_or_video = params["article_or_video"]
  @entry.save

  json @entry
end

get "/api_update_partner" do
  erb :"api/api_update_partner_list"
end

get "/api_update_partner_form/:x" do
  @entry = Partner.find(params["x"].to_i)
  erb :"api/api_update_partner_form"
end

get "/api_change_partner/:x" do
  @entry = Partner.find(params["x"].to_i)
  @entry.assignment_id = params["assignment_id"] 
  @entry.partner = params["partner"]
  @entry.save
  
  json @entry
end

get "/api_delete_assign_list" do
  erb :"api/api_delete_assign_list"
end

get "/api_delete_assign/:x" do
  a = Assignment.new("id" => params["x"].to_i)
  a.delete
  
  json a
end

get "/api_delete_link_list" do
  erb :"api/api_delete_link_list"
end

get "/api_delete_link/:x" do
  l = Link.new("id" => params["x"].to_i)
  l.delete
  
  json l
end

get "/api_delete_partner_list" do
  erb :"api/api_delete_partner_list"
end

get "/api_delete_partner/:x" do
  p = Partner.new("id" => params["x"].to_i)
  p.delete
  
  json p
end



