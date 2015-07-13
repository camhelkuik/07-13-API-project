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
  
end

get "/api_all_partners" do
  
end

