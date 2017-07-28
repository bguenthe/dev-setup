require 'spec_helper'

describe package('docker-ce') do
  it { should be_installed }
end

describe group('docker') do
  it { should exist }
end

describe user('ubuntu') do
  it { should belong_to_group 'docker' }
end

describe process('dockerd') do
  it { should be_running }
end
