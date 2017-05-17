defmodule SecurityTest.Router do
  use SecurityTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated,  handler: SecurityTest.Token
    plug Guardian.Plug.LoadResource
  end

  pipeline :api_auth do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated,  handler: SecurityTest.ApiToken
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SecurityTest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/", SecurityTest do
    pipe_through [:browser, :browser_auth]
    resources "/users", UserController, only: [:show, :index, :update, :delete]
  end

  scope "/api", SecurityTest do
    pipe_through [:browser]
    get "/login", ApiLoginController, :login
  end

  scope "/api", SecurityTest do
    pipe_through [:browser, :api_auth]
    get "/sum", ApiController, :sum
    get "/logout", ApiController, :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", SecurityTest do
  #   pipe_through :api
  # end
end
