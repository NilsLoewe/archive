name "db_server" do
  run_list("recipe[capistrano]",
           "recipe[ruby]",
           "recipe[rails]",
           "recipe[postgresql]")
end
