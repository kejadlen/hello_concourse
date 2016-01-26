task :hello do
  sh "GOOS=linux go build -o services/hello/hello services/hello/hello.go"
end

namespace :concourse do
  desc "Update Concourse"
  task :update do
    sh "./vagrant/fly set-pipeline -p hello_concourse -c concourse/concourse.yml"
  end
end
