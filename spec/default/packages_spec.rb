require 'spec_helper'

describe package('unzip') do
  it { should be_installed }
end

describe package('jq') do
  it { should be_installed }
end

describe package('python-pip') do
  it { should be_installed }
end

describe package('git-core') do
  it { should be_installed }
end

describe package('ntp') do
  it { should be_installed }
end

describe package('default-jdk') do
  it { should be_installed }
end

describe package('maven') do
  it { should be_installed }
end

describe package('postgresql') do
  it { should be_installed }
end

describe package('postgresql-contrib') do
  it { should be_installed }
end