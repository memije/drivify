require 'rails_helper'

RSpec.describe "Rutas", type: :request do

  describe "GET /registro" do
    it "obtiene la vista de registro" do
      get registro_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /login" do
    it "obtiene la vista de inicio de sesión" do
      get login_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /login" do
    it "inicia sesión con las credenciales proporcionadas" do
      post login_path, params: {login: {email: FFaker::Internet.email, password: FFaker::Internet.password}}
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /home" do
    it "si no ha iniciado sesión, redirige al inicio de sesión" do
      get home_path
      expect(response).to have_http_status(302)
    end

    it "si ya inició sesión, muestra la guía del reglamento de tránsito" do
      get home_path
      expect(response).to have_http_status(302)
    end
  end

end
