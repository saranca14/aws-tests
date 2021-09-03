content = inspec.profile.file("terraform.json")
params = JSON.parse(content)
# load data from terraform output
kms_key_id = params['customer_kms_key_id']['value']

describe aws_kms_key(key_id: kms_key_id) do
  it { should exist }
end
