#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'spec_helper'

describe KomachiHeartbeat::HeartbeatController do
  describe "GET version" do
    before { get "version", :use_route => 'ops' }
    subject { response }
    it { should be_success }

    describe "body" do
      subject { OpenStruct.new(JSON.load(response.body)) }
      its(:name) { should == "Dummy App"}
      its(:version) { should == "1.0.0"}
    end
  end

  describe "GET index" do
    before { get "index", :use_route => 'ops' }
    subject { response }
    it { should be_success }
  end
end
