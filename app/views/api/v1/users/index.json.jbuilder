json.array! @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.role user.role.name
  json.job_applications user.job_applications do |job|
    json.id job.id
    json.title job.title
    json.company job.company
  end
end