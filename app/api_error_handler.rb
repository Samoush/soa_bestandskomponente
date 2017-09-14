# trap all exceptions and fail gracefuly with a 500 and a proper message
class ApiErrorHandler < Grape::Middleware::Base
  def call!(env)
    @env = env
    begin
      @app.call(@env)
    rescue ActiveRecord::RecordNotFound => e 
    	throw :error, :message => e.message || options[:default_message], :status => 400
    rescue Exception => e
      throw :error, :message => e.message || options[:default_message], :status => 500
    end
  end
end