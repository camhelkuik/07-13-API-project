#Show all of the assignments
get "/api/assignments" do
  all =  Assignment.all_as_hash
  
  json all
end

#TODO - fix so it shows partner
#Finds an assignment by the ID and shows all of the info including partner and article and/or video
get "/api/assignment_id" do
  assignment = Assignment.find_as_hash(params["id"])
  link = Link.find_rows_hash("assignment_id", params["id"])
  
  partner = 
  
  json [assignment, link]
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
get "/api/partner_assign" do
  search_partner = Assignment.find_rows_hash("partner_id", params["partner_id"])
  
  json search_partner
end

#Adds an assignment
get "/api/add_assign" do
  @new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"], "partner_id" => params["partner_id"]})
  
  hash = {"name" => params["name"], "description" => params["description"], "github" => params["github"], "partner_id" => params["partner_id"]}

  json hash
end

#Changes an article and/or video link for an assignment.
get "/api/change_link" do
  @entry = Link.find_rows("assignment_id", params["id"])
  @entry[0].article_or_video =  params["article_or_video"]
  @entry[0].assignment_id = params["id"]
  @entry[0].save

  json @entry[0].make_hash
end

#Changes a partner for an assignment
get "/api/change_partner" do
  @entry = Assignment.find_rows("id", params["id"])
  @entry[0].partner_id = params["partner_id"]
  @entry[0].save
  
  json @entry[0].make_hash
end

#Deletes an assignment
get "/api/delete_assign" do
  a = Assignment.find(params["id"].to_i) 
  a.delete
  
  json a.make_hash
end

#Deletes an article and/or video link
get "/api/delete_link" do
  l = Link.find(params["id"].to_i)
  l.delete
  
  json l.make_hash
end

#Deletes a partner
get "/api/delete_partner" do
  p = Partner.find(params["id"].to_i)
  p.delete
  
  json p.make_hash
end



