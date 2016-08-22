#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

describe KomachiHeartbeat::HeartbeatController, type: :controller do
  describe "GET version" do
    before { get "version", params_wrapper(use_route: 'ops') }
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
    end

    subject do
      # exercise
      get "index", params_wrapper(params)
      response
    end

    let(:params) { { use_route: 'ops', format: format } }

    context "When successful" do
      context "When default format" do
        let(:format) { nil }

        it { should be_success }
        its(:body) { should eq "heartbeat:ok" }
      end

      context "When svg format" do
        let(:format) { "svg" }

        it { should be_success }

        its(:body) { should start_with '<svg xmlns="http://www.w3.org/2000/svg" width="99" height="18">' }
        its(:body) { should include '<text x="80" y="13">ok</text>' }
        its(:content_type) { should eq "image/svg+xml" }
      end
    end

    context "When error is occurred" do
      before do
        allow(controller).to receive(:db_check?) { raise "something wrong!" }
      end

      context "When default format" do
        let(:format) { nil }

        its(:status) { should eq 500 }

        # NOTE: Rails 3.2~4.1 is " "
        #   Rails 4.2+ is ""
        its(:body) { should match /^[ ]*$/ }
      end

      context "When svg format" do
        let(:format) { "svg" }

        it { should be_success }

        its(:body) { should start_with '<svg xmlns="http://www.w3.org/2000/svg" width="99" height="18">' }
        its(:body) { should include '<text x="80" y="13">NG</text>' }
        its(:content_type) { should eq "image/svg+xml" }
      end
    end
  end
end
