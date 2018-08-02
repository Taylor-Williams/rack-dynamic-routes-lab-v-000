class Application
  require_relative './item.rb'
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path =~ /items/
      item = @@items.each.detect{|i|i.name = req.path.split("items")[1]}
      if item
        return item.price
      else
        resp.write "i do not have that item"
        req.status = 400
      end
    else
      resp.write "Route not found"
      req.status = 404
    end
    resp.finish
  end
end
