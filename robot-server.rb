require 'sinatra'
require 'socket'     

set :bind, '127.0.0.1'
set :port, 4567


hostname = 'localhost'
port = 2000

#hostname = '192.168.43.208'
#port = 8090

s = TCPSocket.open(hostname, port)

get '/' do
	erb  :althome
end

get '/old' do
	erb  :home
end

post '/:com' do  
	case params[:com]
		when "codehere40"
			s.print "back"
		when "codehere39"
			s.print "right"
		when "codehere38"
			s.print "front"
		when "codehere37"
			s.print "left"
		when "stahp"
			s.print "stop"
		end
end

error Sinatra::NotFound do
		@pname = request.path_info[1, request.path_info.length]
		erb  :fourofour

end