require 'bundler/setup'
Bundler.require(:default)

def do_i_have_gpt_4?
  c = OpenAI::Client.new(access_token: ENV.fetch('OPENAI_ACCESS_TOKEN'))
  c.models.list['data'].map {|d| d['id']}.grep(/^gpt-4/).length.zero? ? 'no' : 'yes'
end

run do |env|
  [200, {}, [do_i_have_gpt_4?]]
end
