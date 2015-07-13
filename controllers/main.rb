get "/home" do
  erb :"home"
end

get "/add_menu" do
  erb :"add_menu"
end

get "/add_assignment" do
  erb :"add/add_assignment"
end

get "/save_assignment" do
  @new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"]})
   erb :"main/add_success"
end

get "/add_link" do
  erb :"add/add_link"
end

get "/save_link" do
  @new_entry = Link.add({"assignment_id" => params["assignment_id"], "article_or_video" => params["article_or_video"]})
   erb :"main/add_success"
end

get "/add_partner" do
  erb :"add/add_partner"
end

get "/save_partner" do
  @new_entry = Partner.add({"assignement_id" => params["assignment_id"], "partner" => params["partner"]})
   erb :"main/add_success"
end