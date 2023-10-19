defmodule ProductSearchAppWeb.Schema do
  use Absinthe.Schema

  alias ProductSearchAppWeb.CatalogResolver

  object :product do
    field :id, :integer
    field :is_active, non_null(:string)
    field :price, non_null(:string)
    field :picture, non_null(:string)
    field :name, non_null(:string)
    field :about, non_null(:string)
    field :tags, non_null(:string)
  end

  query do
    # this is the query entry point to our app
    @desc "Get all products"
    field :all_products, non_null(list_of(non_null(:product))) do
      resolve(&CatalogResolver.all_products/3)
    end

    @desc "Search all products"
    field :search_products, non_null(list_of(non_null(:product))) do
      arg(:search_query, :string)
      arg(:search_result_limit, :integer)

      resolve(&CatalogResolver.search_products/3)
    end
  end
end
