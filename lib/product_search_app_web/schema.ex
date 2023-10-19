defmodule ProductSearchAppWeb.Schema do
  use Absinthe.Schema

  alias ProductSearchAppWeb.CatalogResolver

  object :product do
    field :_id, non_null(:string)
    field :is_active, non_null(:string)
    field :price, non_null(:string)
    field :picture, non_null(:string)
    field :name, non_null(:string)
    field :about, non_null(:string)
    field :tags, non_null(:string)
  end
end
