get "/update_menu" do
  erb :"main/update_menu"
end

get "/update_assignment" do
  erb :"update/update_assignment_list"
end

get "/update_assignment_form/:x" do
  @entry = Assignment.find(params["x"].to_i)
  erb :"update/update_assignment_form"
end

get "/change_assignment/:x" do
  @entry = Assignment.find(params["x"].to_i)
  @entry.name = params["name"] 
  @entry.description = params["description"]
  @entry.github = params["github"]  
  @entry.save
return "Success!"
end

get "/update_link" do
  erb :"update/update_link_list"
end

get "/update_link_form/:x" do
  @entry = Link.find(params["x"].to_i)
  erb :"update/update_link_form"
end

get "/change_link/:x" do
  @entry = Link.find(params["x"].to_i)
  @entry.assignment_id = params["assignment_id"] 
  @entry.article_or_video = params["article_or_video"]
  @entry.save
return "Success!"
end

get "/update_partner" do
  erb :"update/update_partner_list"
end

get "/update_partner_form/:x" do
  @entry = Partner.find(params["x"].to_i)
  erb :"update/update_partner_form"
end

get "/change_partner/:x" do
  @entry = Partner.find(params["x"].to_i)
  @entry.assignment_id = params["assignment_id"] 
  @entry.partner = params["partner"]
  @entry.save
return "Success!"
end