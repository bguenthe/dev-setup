require 'spec_helper'

describe file('/repos') do
  it { should be_directory }
end

describe file('/repos/intrastat') do
  it { should be_directory }
end

describe file('/repos/cd-server') do
  it { should be_directory }
end
