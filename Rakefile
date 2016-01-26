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
    sh "./vagrant/fly set-pipeline --pipeline=hello_concourse --config=concourse/concourse.yml --var=cf-username=#{ENV["CF_USERNAME"]} --var=cf-password=#{ENV["CF_PASSWORD"]}"
  end
end

namespace :cf do
  desc "Push everything to CF"
  task push: "services/hello/hello" do
    cd "services/hello" do
      sh "cf push"
      rm "hello"
    end
  end

  file "services/hello/hello" => "services/hello/hello.go" do
    sh "GOOS=linux go build -o services/hello/hello services/hello/hello.go"
  end
  CLOBBER.include("services/hello/hello")
end

