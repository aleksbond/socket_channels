defmodule SocketChannelsWeb.Router do
  use SocketChannelsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SocketChannelsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/lead_form", PageController, :lead_form
    post "/lead_form", PageController, :lead_form_create
  end

  # Other scopes may use custom stacks.
  # scope "/api", SocketChannelsWeb do
  #   pipe_through :api
  # end
end
