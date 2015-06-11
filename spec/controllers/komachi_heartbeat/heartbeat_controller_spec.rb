#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

describe KomachiHeartbeat::HeartbeatController, type: :controller do
  describe "GET version" do
    before { get "version", :use_route => 'ops' }
    subject { response }
    it { should be_success }

    describe "body" do
      subject { OpenStruct.new(JSON.load(response.body)) }
      its(:name) { should == "Dummy App"}
      its(:version) { should == "1.0.0"}
      its(:revision) { should == "deadbeaf" }
    end
  end

  describe "GET index" do
    before do
      # setup
      # `memcache_mock` does not support stats and reset
      mock_memcache = double("MemCache")
      allow(mock_memcache).to receive(:stats)
      allow(mock_memcache).to receive(:reset)
      allow(MemCache).to receive(:new){ mock_memcache }

      # exercise
      get "index", :use_route => 'ops'
    end
    subject { response }
    it { should be_success }
  end
end
