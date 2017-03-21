require 'rbconfig'
require 'spec_helper'

describe(Jekyll) do
  let(:overrides) do
    {
      "source"      => source_dir,
      "destination" => dest_dir,
      "url"         => "http://example.org",
    }
  end

  let(:config) do
    Jekyll.configuration(overrides)
  end

  let(:site)      { Jekyll::Site.new(config) }
  let(:contents)  { File.read(dest_dir("index.html")) }

  before(:each) do
    site.process
  end

  it 'has a version number' do
    expect(Jekyll::ThumborTag::VERSION).not_to be nil
  end

  it 'does the template tag work' do
    expect(contents).to match(/^<img src="https:\/\/thumbor.example.com\/(.*)=\/500x500\/https:\/\/example.com\/picture.jpg">$/)
  end
end
