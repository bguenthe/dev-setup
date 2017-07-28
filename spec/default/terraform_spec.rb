require 'spec_helper'

describe command('terraform --version') do
  its(:stdout) { should match 'Terraform v0.9.11' }
end
