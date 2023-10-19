defmodule ProductSearchApp.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductSearchApp.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        about: "some about",
        is_active: true,
        name: "some name",
        picture: "some picture",
        price: "some price",
        tags: "some tags"
      })
      |> ProductSearchApp.Products.create_product()

    product
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        about: "some about",
        is_active: true,
        name: "some name",
        picture: "some picture",
        price: 42,
        tags: "some tags"
      })
      |> ProductSearchApp.Products.create_product()

    product
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        about: "some about",
        is_active: true,
        name: "some name",
        picture: "some picture",
        price: 42
      })
      |> ProductSearchApp.Products.create_product()

    product
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        _id: "7488a646-e31f-11e4-aace-600308960662",
        about: "some about",
        is_active: true,
        name: "some name",
        picture: "some picture",
        price: 42
      })
      |> ProductSearchApp.Products.create_product()

    product
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        _id: "7488a646-e31f-11e4-aace-600308960662",
        about: "some about",
        is_active: true,
        name: "some name",
        picture: "some picture",
        price: 42,
        tags: "some tags"
      })
      |> ProductSearchApp.Products.create_product()

    product
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        _id: "some _id",
        about: "some about",
        is_active: true,
        name: "some name",
        picture: "some picture",
        price: 42,
        tags: "some tags"
      })
      |> ProductSearchApp.Products.create_product()

    product
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        about: "some about",
        id: 42,
        is_active: true,
        name: "some name",
        picture: "some picture",
        price: 42,
        tags: "some tags"
      })
      |> ProductSearchApp.Products.create_product()

    product
  end
end
