content = inspec.profile.file("terraform.json")
params = JSON.parse(content)
# load data from terraform output
cae_assume_role_name = params['cae_assume_role']['value']
cae_assume_role_policy_name = params['cae_assume_role_policy']['value']
print "cae_assume_role_name"
describe aws_iam_role(role_name: 'cae-assume-role') do
    it               { should exist }
    its('role_name') { should eq cae_assume_role_name }
end
describe aws_iam_policy(policy_name: cae_assume_role_policy_name) do
  it { should exist }
end
