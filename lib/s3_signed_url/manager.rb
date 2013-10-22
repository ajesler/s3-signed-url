require 'openssl'
require 'digest/sha1'
require 'base64'
require 'cgi'

module S3SignedUrl
  class Manager

    # function based on https://gist.github.com/mcansky/3434417
    def build_signed_from_parts(path, bucket, expiry, access_key, access_secret, protocol = "https")
        digest = OpenSSL::Digest::Digest.new('sha1')
        can_string = "GET\n\n\n#{expiry}\n/#{bucket}/#{path}"
        hmac = OpenSSL::HMAC.digest(digest, access_secret, can_string)
        signature = encode_signs(CGI.escape(Base64.encode64(hmac).strip))
        "#{protocol}://s3.amazonaws.com/#{bucket}/#{path}?AWSAccessKeyId=#{access_key}&Expires=#{expiry}&Signature=#{signature}"
    end

    def build_signed_url(url, expiry, access_key, access_secret)
        digest = OpenSSL::Digest::Digest.new('sha1')
        path = /^(?:https?:\/\/)?([^\/]+)\/?([^\?]*)\??(\S*)$/.match(url)[2]
        can_string = "GET\n\n\n#{expiry}\n/#{path}"
        hmac = OpenSSL::HMAC.digest(digest, access_secret, can_string)
        signature = encode_signs(CGI.escape(Base64.encode64(hmac).strip))
        "#{url}?AWSAccessKeyId=#{access_key}&Expires=#{expiry}&Signature=#{signature}"
    end

    def encode_signs(string)
      signs = {'+' => "%2B", '=' => "%3D", '?' => '%3F', '@' => '%40',
        '$' => '%24', '&' => '%26', ',' => '%2C', '/' => '%2F', ':' => '%3A',
        ';' => '%3B', '?' => '%3F'}
      signs.keys.each do |key|
        string.gsub!(key, signs[key])
      end
      string
    end

  end
end