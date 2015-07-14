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
  search_partner = Partner.find_rows("partner", params["id"]) 
  assign_id = search_partner["assignment_id".to_i]
  find_assign = Assignment.find_rows_hash("id", assign_id)
  
  json find_assign
end


get "/api/add_assign" do
  @new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"]})
  
  hash = {"name" => params["name"], "description" => params["description"], "github" => params["github"]}

  json hash
end

#Getting errors for changing link and partner
get "/api/change_link" do
  @entry = Link.find_rows("assignment_id", params["id"])
  @entry.article_or_video =  params["article_or_video"]
  @entry.save

  json @entry
end

get "/api/change_partner" do
  @entry = Partner.find_rows("assignment_id", params["id"])
  @entry.partner = params["partner"]
  @entry.save
  
  json @entry
end


#Delete routes return objects not json, but do work
get "/api/delete_assign" do
  a = Assignment.find(params["id"].to_i) 
  a.delete
  
  json a
end

get "/api/delete_link" do
  l = Link.find(params["id"].to_i)
  l.delete
  
  json l
end

get "/api/delete_partner" do
  p = Partner.find(params["id"].to_i)
  p.delete
  
  json p
end



