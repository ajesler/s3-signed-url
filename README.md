# S3SignedUrl

Generates signed urls for S3 objects.

## Installation

```bash
$ gem install s3-signed-url
```

## Usage

### Setting up credentials

This gem uses aws-creds to supply the AWS credentials. See http://rubydoc.info/gems/aws-creds

It expects a file `~/.awscreds` with the format (chmod it to 0600 or similar)

```
default:AKIAIOSFODNNDEADBEEF:WT8ftNba7siVx5UOoGzJSyd82uNCZAC8LCllzcWp
s3user:AKIAIOO432MG8BADF00D:T60q14wrbyxl3Ed13VOFA/2G+nvJR/jgHC42jIH1
```

### Command Line Usage


```bash
# sign a single url using the default profile
s3signedurl -u "http://s3.amazonaws.com/codinghorrorimg/codinghorror-bandwidth-usage.png"

# sign a single url based on a path and bucket and generate a CURL command to download
s3signedurl -b <bucket> -p <path> -e "1 day" -c s3user -x CURL

# sign a single url based on s3.amazonaws.com prefix.
s3signedurl -u "http://s3.amazonaws.com/codinghorrorimg/codinghorror-bandwidth-usage.png" -e "1 week"

# sign urls listed in a file, one per line, and output to another file.
s3signedurl -f path/to/file.txt -e "3 days" -o path/to/output.txt
```

## Changelog

See the [changelog](CHANGELOG.md) file.

## Roadmap

- [ ] Allow direct entry of AWS key and secret via command line params
- [ ] Support batch signing urls with input file and output files
- [ ] Add -b and -p functionality
- [ ] Add download command generation


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
