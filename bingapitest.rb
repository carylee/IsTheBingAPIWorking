require 'rbing'
require 'sinatra'
$BINGAPPID = ENV['BINGAPPID']

get '/' do
  @answer = bing_working? ? 'Yes' : 'No'
  haml :index
end

def bing_working?
  bing = RBing.new($BINGAPPID)
  rsp = bing.web("site:chicagotribune.com budget", :count=>50)
  not rsp.web.total == 42
end
