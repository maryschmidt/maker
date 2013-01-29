json.array!(@projects) do |json, project|
  json.name project.image_file_name
  json.size project.image_file_size
  json.url project.image.url(:original)
  json.thumbnail_url project.image.url(:thumb)
  json.delete_url project_url(project)
  json.delete_type "DELETE"
end
