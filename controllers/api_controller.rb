get "/api_assignments" do
  @all =  Assignment.all
  
  json @all
end

# get "/api_list" do
#   erb :"/api/api_list"
# end

get "/api_assign_list/:id" do
  @assignment = Assignment.find(params["id"])
  @partner = Partner.find(params["id"])
  @link = Link.find(params["id"])
  
  json 
end