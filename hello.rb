require 'sinatra'

get '/hi' do
  "hi"
end

get '/' do
  ua = Net::HTTP.new('https://sinatra-greetings.herokuapp.com/hi', 443)
    ua.instance_eval {
      @ssl_context = OpenSSL::SSL::SSLContext.new
#       options = OpenSSL::SSL::OP_NO_SSLv2 | OpenSSL::SSL::OP_NO_SSLv3
#       if OpenSSL::SSL.const_defined?('OP_NO_COMPRESSION')
#         options |= OpenSSL::SSL::OP_NO_COMPRESSION
#       end
#       @ssl_context.set_params({options: options})
      @ssl_context.ssl_version = :TLSv1_3
    }
   # ua.instance_eval { @ssl_context = OpenSSL::SSL::SSLContext.new(:TLSv1_2) }
    ua.use_ssl = true
  ua.request 
end

#
