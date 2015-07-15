#API Project
This API project is used to get Omaha Code School assignments. There are three tables that make up an assignment. The assignments table, the partner table and the links table. Each assignment has an id, a name, a description, a github link and a partner_id. The partner table is just an id and a name. The links table is an id, assignment_id, and a link to either an article or a video. The API's responses are in JSON. 

##Requests
Here is the list of all of the requests. Only five of these are currently implemnted. 

###List of all assignments - currently implemented

```ruby
get "/api/assignments" do
  all =  Assignment.all_as_hash
  
  json all
end
```

###Single assignment info - currently implemented

```ruby
get "/api/assignment_id" do
  assignment = Assignment.find_as_hash(params["id"])
  link = Link.find_rows_hash("assignment_id", params["id"])
  
  partner = 
  
  json [assignment, link]
end
```
###List of all article or video links - currently implemented

```ruby
get "/api/all_links" do
  all_link = Link.all_as_hash
  
  json all_link
end
````

###List of all the partners - currently implemented

```ruby
get "/api/all_partners" do
  all_partner = Partner.all_as_hash
  
  json all_partner
end
````
###List of assignments with a particular partner
This route takes an argument of a partner_id and then finds all of the assignments that where with that partner.

```ruby
get "/api/partner_assign" do
  search_partner = Assignment.find_rows_hash("partner_id", params["partner_id"])
  
  json search_partner
end
````

###Add assignment

```ruby
get "/api/add_assign" do
  @new_entry = Assignment.add({"name" => params["name"], "description" => params["description"], "github" => params["github"], "partner_id" => params["partner_id"]})
  
  hash = {"name" => params["name"], "description" => params["description"], "github" => params["github"], "partner_id" => params["partner_id"]}

  json hash
end
````

###Update an article or video link

```ruby
get "/api/change_link" do
  @entry = Link.find_rows("assignment_id", params["id"])
  @entry[0].article_or_video =  params["article_or_video"]
  @entry[0].assignment_id = params["id"]
  @entry[0].save

  json @entry[0].make_hash
end
````

###Update a partner to an assignment

```ruby
get "/api/change_partner" do
  @entry = Assignment.find_rows("id", params["id"])
  @entry[0].partner_id = params["partner_id"]
  @entry[0].save
  
  json @entry[0].make_hash
end
````

###Delete an assignment - currently implemented

```ruby
get "/api/delete_assign" do
  a = Assignment.find(params["id"].to_i) 
  a.delete
  
  json a.make_hash
end
````

###Delete an article or video link

```ruby
get "/api/delete_link" do
  l = Link.find(params["id"].to_i)
  l.delete
  
  json l.make_hash
end
````

###Delete a partner

```ruby
get "/api/delete_partner" do
  p = Partner.find(params["id"].to_i)
  p.delete
  
  json p.make_hash
end
````