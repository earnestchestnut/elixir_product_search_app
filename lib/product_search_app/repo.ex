defmodule ProductSearchApp.Repo do
  use Ecto.Repo,
    otp_app: :product_search_app,
    adapter: Ecto.Adapters.SQLite3
end
