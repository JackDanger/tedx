require 'spec_helper'

describe EarlyContactsController do
  context "#index" do
    subject { get :index; response }

    it { should be_success }
  end
end
