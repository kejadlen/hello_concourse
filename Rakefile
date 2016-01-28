require "rake/clean"

namespace :dev do
  desc "Run services locally"
  task :run do
    cd "services" do
      sh "foreman start --procfile=services/Procfile.dev"
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

  task :init do
    # sh "brew cask install vagrant"
    # sh "brew cask install virtualbox"
    sh "vagrant up"
    sh "open http://192.168.100.4:8080"
    # Update Concourse
  end
end

namespace :cf do
  desc "Push everything to CF"
  task push: "services/hello/hello" do
    sh "cf push -f services/app/manifest.yml -p services/app/"
    sh "cf push -f services/world/manifest.yml -p services/world/"
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

