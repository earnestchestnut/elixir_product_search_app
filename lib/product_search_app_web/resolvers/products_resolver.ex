defmodule ProductSearchAppWeb.CatalogResolver do
  alias ProductSearchApp.Products

  def all_products(_root, _args, _info) do
    {:ok, Products.list_products()}
  end

  def search_products(_root, args, _info) do
    {:ok, Products.search_products!(args)}
  end
end
