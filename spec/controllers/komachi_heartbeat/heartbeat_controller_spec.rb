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
    render_views

    before do
      # setup
      # `memcache_mock` does not support stats and reset
      mock_memcache = double("MemCache")
      allow(mock_memcache).to receive(:stats)
      allow(mock_memcache).to receive(:reset)
      allow(MemCache).to receive(:new){ mock_memcache }

      # exercise
      get "index", params
    end

    let(:params) { { use_route: 'ops', format: format } }

    subject { response }

    context "When default format" do
      let(:format) { nil }

      it { should be_success }
      its(:body) { should eq "heartbeat:ok" }
    end

    context "When svg format" do
      let(:format) { "svg" }

      it { should be_success }

      its(:body) { should start_with '<svg xmlns="http://www.w3.org/2000/svg" width="99" height="18">' }
      its(:content_type) { should eq "image/svg+xml" }
    end
  end
end
