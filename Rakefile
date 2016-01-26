require "rake/clean"

namespace :dev do
  desc "Run services locally"
  task :run do
    cd "services" do
      sh "foreman start"
    end
  end
end

namespace :concourse do
  desc "Update Concourse"
  task :update do
    sh "./vagrant/fly set-pipeline -p hello_concourse -c concourse/concourse.yml"
  end
end

namespace :cf do
  desc "Push everything to CF"
  task push: "services/hello/hello" do
    sh "cf push -f services/hello.yml"
  end

  file "services/hello/hello" => "services/hello/hello.go" do
    sh "GOOS=linux go build -o services/hello/hello services/hello/hello.go"
  end
  CLOBBER.include("services/hello/hello")
end

