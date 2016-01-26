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
    args = [[:pipeline, "hello_concourse"],
            [:config, "concourse/concourse.yml"]]

    vars = %w[ cf-username cf-password s3-access-key-id s3-secret-access-key ]
    vars.each.with_object(args) do |var, args|
      args << ["var", "#{var}=#{ENV[var.gsub(?-, ?_).upcase]}"]
    end

    sh "./vagrant/fly set-pipeline #{args.map {|k,v| "--#{k}=#{v}" }.join(" ")}"
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

