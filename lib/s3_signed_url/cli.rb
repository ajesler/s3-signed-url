require 'trollop'
require 'aws/creds'
require 's3_signed_url/manager'
require 's3_signed_url/version'
require 'chronic'

module S3SignedUrl
  class CLI

    def start
      opts = Trollop::options do
        version "s3signedurl #{S3SignedUrl::VERSION} (c) Andrew Esler 2013"

        banner <<-BANNER
This is the program description

Usage:
  s3signedurl [options]
where [options] are:
        BANNER

        opt :url, "The url to use", :type => :string
        opt :expiry, "The expiry time of the url. Eg 'oct 30', '' ", :default => "tomorrow"
        opt :credentials, "The AWS credentials profile to use", :default => "default"
      end

      puts sign(opts)
    end

    def sign(opts)

      creds = AWS::Creds[opts[:credentials]]
      Trollop::die :credentials, "Unable to find credentials for #{opts[:credentials]}" unless creds

      Trollop::die :url unless opts[:url]

      expiry = Chronic.parse(opts[:expiry]).to_i
      
      manager = S3SignedUrl::Manager.new

      signed = manager.build_signed_url(opts[:url], expiry, creds.access_key_id, creds.secret_access_key)
    end

  end
end