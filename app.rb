require 'webrick'

# Obtiene el puerto desde la variable de entorno o usa 4567 por defecto
port = ENV['PORT'] || 4567

# Crea el servidor HTTP
server = WEBrick::HTTPServer.new :Port => port

# Define una ruta para la raíz "/"
server.mount_proc '/' do |req, res|
  res.content_type = 'text/html'
  res.body = "<h1>Hello from Ruby HTTP Server!</h1>"
  res.body = "<h1>Developer name: Willian Vargas!</h1>"
end

# Inicia el servidor
trap('INT') { server.shutdown }
server.start
