defmodule ProductSearchApp.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :integer, []}
  schema "products" do
    #field :id, :integer
    field :name, :string
    field :about, :string
    field :is_active, :boolean, default: false
    field :picture, :string
    field :price, :integer
    field :tags, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:about, :is_active, :name, :picture, :price, :id, :tags])
    |> validate_required([:about, :is_active, :name, :picture, :price, :id, :tags])
  end
end
