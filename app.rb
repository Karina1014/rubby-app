# app.rb
require 'webrick'

# Usa el puerto asignado por el entorno (Render lo pasará como una variable de entorno)
port = ENV['PORT'] || 4567  # Usa PORT de la variable de entorno o 4567 por defecto

# Crea el servidor HTTP
server = WEBrick::HTTPServer.new :Port => port

# Define una ruta para la raíz "/"
server.mount_proc '/' do |req, res|
  res.content_type = 'text/html'
  res.body = "<h1>Hello from Ruby HTTP Server!</h1>"
  res.body += "<h1>Developer name: Willian Vargas!</h1>"
end

# Inicia el servidor
trap('INT') { server.shutdown }
server.start
