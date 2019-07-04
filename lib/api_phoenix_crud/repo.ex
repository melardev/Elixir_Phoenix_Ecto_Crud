defmodule ApiPhoenixCrud.Repo do
  use Ecto.Repo,
    otp_app: :api_phoenix_crud,
    adapter: Ecto.Adapters.Postgres
end
