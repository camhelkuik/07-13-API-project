get "/api/assignments" do
  all =  Assignment.all_as_hash
  
  json all
end

get "/api/assignment_id" do
  assignment = Assignment.find_as_hash(params["id"])
  partner = Partner.find_rows_hash("assignment_id", params["id"])
  link = Link.find_rows_hash("assignment_id", params["id"])
  
  json [assignment, partner, link]
end

get "/api/all_links" do
  all_link = Link.all_as_hash
  
  json all_link
end

get "/api/all_partners" do
  all_partner = Partner.all_as_hash
  
  json all_partner
end

#Not working and not sure why
get "/api/partner_assign" do
  search_partner = Partner.search_rows_hash("partner", params["id"]) 
  assign_id = search_partner["assignment_id"].to_i 
  find_assign = Assignment.find_rows_hash("id", assign_id)
  
  json find_assign
end


get "/api/add_assign" do
  @new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"]})
  
  hash = {"name" => params["name"], "description" => params["description"], "github" => params["github"]}

  json hash
end


get "/api/change_link/" do
  @entry = Link.find(params["x"].to_i)
  @entry.assignment_id = params["assignment_id"] 
  @entry.article_or_video = params["article_or_video"]
  @entry.save

  json @entry
end

get "/api_change_partner/:x" do
  @entry = Partner.find(params["x"].to_i)
  @entry.assignment_id = params["assignment_id"] 
  @entry.partner = params["partner"]
  @entry.save
  
  json @entry
end

get "/api_delete_assign/:x" do
  a = Assignment.new("id" => params["x"].to_i)
  a.delete
  
  json a
end

get "/api_delete_link/:x" do
  l = Link.new("id" => params["x"].to_i)
  l.delete
  
  json l
end

get "/api_delete_partner/:x" do
  p = Partner.new("id" => params["x"].to_i)
  p.delete
  
  json p
end



