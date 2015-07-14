#Show all of the assignments
get "/api/assignments" do
  all =  Assignment.all_as_hash
  
  json all
end

#Finds an assignment by the ID and shows all of the info including partner and article and/or video
get "/api/assignment_id" do
  assignment = Assignment.find_as_hash(params["id"])
  partner = Partner.find_rows_hash("assignment_id", params["id"])
  link = Link.find_rows_hash("assignment_id", params["id"])
  
  json [assignment, partner, link]
end

#Show all of the article and/or video links
get "/api/all_links" do
  all_link = Link.all_as_hash
  
  json all_link
end

#Show all of the various partners
get "/api/all_partners" do
  all_partner = Partner.all_as_hash
  
  json all_partner
end

#Takes the ID of a partner and then finds all of the assignments that the partner has been a part of.

#Not working and not sure why
get "/api/partner_assign" do
  search_partner = Partner.find_rows("partner", params["id"]) 
  assign_id = search_partner["assignment_id".to_i]
  find_assign = Assignment.find_rows_hash("id", assign_id)
  
  json find_assign
end

#Adds an assignment
get "/api/add_assign" do
  @new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"]})
  
  hash = {"name" => params["name"], "description" => params["description"], "github" => params["github"]}

  json hash
end

#Changes an article and/or video link for an assignment.

#Getting errors for changing link and partner
get "/api/change_link" do
  @entry = Link.find_rows("assignment_id", params["id"])
  @entry.article_or_video =  params["article_or_video"]
  @entry.save

  json @entry
end

#Changes a partner for an assignment
get "/api/change_partner" do
  @entry = Partner.find_rows("assignment_id", params["id"])
  @entry.partner = params["partner"]
  @entry.save
  
  json @entry
end

#Deletes an assignment

#Delete routes return objects not json, but do work
get "/api/delete_assign" do
  a = Assignment.find(params["id"].to_i) 
  a.delete
  
  json a
end

#Deletes an article and/or video link
get "/api/delete_link" do
  l = Link.find(params["id"].to_i)
  l.delete
  
  json l
end

#Deletes a partner
get "/api/delete_partner" do
  p = Partner.find(params["id"].to_i)
  p.delete
  
  json p
end



