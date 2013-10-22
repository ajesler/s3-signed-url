# S3SignedUrl

Generates signed urls for S3 objects.

## Installation

Add this line to your application's Gemfile:

    gem 's3-signed-url'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install s3-signed-url

## Usage

### Setting up credentials

This gem uses aws-creds to supply the AWS credentials. See http://rubydoc.info/gems/aws-creds

It expects a file ~/.awscreds with the format (chmod it to 0600 or similar)

```
default:AKIAIOSFODNNDEADBEEF:WT8ftNba7siVx5UOoGzJSyd82uNCZAC8LCllzcWp
admin:AKIAIOO432MG8BADF00D:T60q14wrbyxl3Ed13VOFA/2G+nvJR/jgHC42jIH1
```

### Command Line Usage


```bash
# sign a single url using the default profile
s3signedurl -u "http://s3.amazonaws.com/codinghorrorimg/codinghorror-bandwidth-usage.png"

# sign a single url
s3signedurl sign -b <bucket> -p <path> -e "1 day" -c s3user -x CURL

# sign a single url based on s3.amazonaws.com prefix.
s3signedurl sign -u "http://s3.amazonaws.com/codinghorrorimg/codinghorror-bandwidth-usage.png" -e "1 week"

# sign urls listed in a file, one per line, and output to another file.
s3signedurl sign -f path/to/file.txt -e "3 days" -o path/to/output.txt
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request