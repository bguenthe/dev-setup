require 'spec_helper'

describe file('/usr/local/share/ca-certificates/ottoroot.crt') do
  it { should exist }
end

describe file('/usr/local/share/ca-certificates/ottosub.crt') do
  it { should exist }
end

describe file('/usr/local/share/ca-certificates/ottoissuing.crt') do
  it { should exist }
end