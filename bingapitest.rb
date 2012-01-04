require 'rbing'
require 'sinatra'
$BINGAPPID = ENV['BINGAPPID']

get '/' do
  @results = bing_results
  @answer = @results > 1000 ? 'Yes' : 'No'
  haml :index
end

def bing_results
  bing = RBing.new($BINGAPPID)
  rsp = bing.web("site:chicagotribune.com budget", :count=>50)
  rsp.web.total
end
