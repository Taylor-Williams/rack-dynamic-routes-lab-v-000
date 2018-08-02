class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path =~ /items/
      item = @@items.each.detect{|i|i.name = req.path.split("items/")[1]}
      if item
        resp.write "#{item.price}"
      else
        resp.write "Item not Found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
