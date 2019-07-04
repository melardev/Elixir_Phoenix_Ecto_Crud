defmodule ApiPhoenixCrudWeb.Router do
  use ApiPhoenixCrudWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ApiPhoenixCrudWeb do
    pipe_through :api
    resources "/todos", TodoController, except: [:new, :edit]
  end
end
