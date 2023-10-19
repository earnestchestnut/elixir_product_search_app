defmodule ProductSearchApp.ProductsTest do
  use ProductSearchApp.DataCase

  alias ProductSearchApp.Products

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{about: nil, is_active: nil, name: nil, picture: nil, price: nil, tags: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{about: "some about", is_active: true, name: "some name", picture: "some picture", price: "some price", tags: "some tags"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.about == "some about"
      assert product.is_active == true
      assert product.name == "some name"
      assert product.picture == "some picture"
      assert product.price == "some price"
      assert product.tags == "some tags"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{about: "some updated about", is_active: false, name: "some updated name", picture: "some updated picture", price: "some updated price", tags: "some updated tags"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.name == "some updated name"
      assert product.picture == "some updated picture"
      assert product.price == "some updated price"
      assert product.tags == "some updated tags"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{about: nil, is_active: nil, name: nil, picture: nil, price: nil, tags: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{about: "some about", is_active: true, name: "some name", picture: "some picture", price: 42, tags: "some tags"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.about == "some about"
      assert product.is_active == true
      assert product.name == "some name"
      assert product.picture == "some picture"
      assert product.price == 42
      assert product.tags == "some tags"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{about: "some updated about", is_active: false, name: "some updated name", picture: "some updated picture", price: 43, tags: "some updated tags"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.name == "some updated name"
      assert product.picture == "some updated picture"
      assert product.price == 43
      assert product.tags == "some updated tags"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{name: nil, about: nil, is_active: nil, picture: nil, price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", about: "some about", is_active: true, picture: "some picture", price: 42}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.about == "some about"
      assert product.is_active == true
      assert product.picture == "some picture"
      assert product.price == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", about: "some updated about", is_active: false, picture: "some updated picture", price: 43}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.picture == "some updated picture"
      assert product.price == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{name: nil, about: nil, is_active: nil, picture: nil, price: nil, _id: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", about: "some about", is_active: true, picture: "some picture", price: 42, _id: "7488a646-e31f-11e4-aace-600308960662"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.about == "some about"
      assert product.is_active == true
      assert product.picture == "some picture"
      assert product.price == 42
      assert product._id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", about: "some updated about", is_active: false, picture: "some updated picture", price: 43, _id: "7488a646-e31f-11e4-aace-600308960668"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.picture == "some updated picture"
      assert product.price == 43
      assert product._id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{name: nil, about: nil, is_active: nil, picture: nil, price: nil, _id: nil, tags: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", about: "some about", is_active: true, picture: "some picture", price: 42, _id: "7488a646-e31f-11e4-aace-600308960662", tags: "some tags"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.about == "some about"
      assert product.is_active == true
      assert product.picture == "some picture"
      assert product.price == 42
      assert product._id == "7488a646-e31f-11e4-aace-600308960662"
      assert product.tags == "some tags"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", about: "some updated about", is_active: false, picture: "some updated picture", price: 43, _id: "7488a646-e31f-11e4-aace-600308960668", tags: "some updated tags"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.picture == "some updated picture"
      assert product.price == 43
      assert product._id == "7488a646-e31f-11e4-aace-600308960668"
      assert product.tags == "some updated tags"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{name: nil, about: nil, is_active: nil, picture: nil, price: nil, _id: nil, tags: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", about: "some about", is_active: true, picture: "some picture", price: 42, _id: "some _id", tags: "some tags"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.about == "some about"
      assert product.is_active == true
      assert product.picture == "some picture"
      assert product.price == 42
      assert product._id == "some _id"
      assert product.tags == "some tags"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", about: "some updated about", is_active: false, picture: "some updated picture", price: 43, _id: "some updated _id", tags: "some updated tags"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.picture == "some updated picture"
      assert product.price == 43
      assert product._id == "some updated _id"
      assert product.tags == "some updated tags"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{id: nil, name: nil, about: nil, is_active: nil, picture: nil, price: nil, tags: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{id: 42, name: "some name", about: "some about", is_active: true, picture: "some picture", price: 42, tags: "some tags"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.id == 42
      assert product.name == "some name"
      assert product.about == "some about"
      assert product.is_active == true
      assert product.picture == "some picture"
      assert product.price == 42
      assert product.tags == "some tags"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{id: 43, name: "some updated name", about: "some updated about", is_active: false, picture: "some updated picture", price: 43, tags: "some updated tags"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.id == 43
      assert product.name == "some updated name"
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.picture == "some updated picture"
      assert product.price == 43
      assert product.tags == "some updated tags"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "products" do
    alias ProductSearchApp.Products.Product

    import ProductSearchApp.ProductsFixtures

    @invalid_attrs %{name: nil, about: nil, is_active: nil, picture: nil, price: nil, tags: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{name: "some name", about: "some about", is_active: true, picture: "some picture", price: 42, tags: "some tags"}

      assert {:ok, %Product{} = product} = Products.create_product(valid_attrs)
      assert product.name == "some name"
      assert product.about == "some about"
      assert product.is_active == true
      assert product.picture == "some picture"
      assert product.price == 42
      assert product.tags == "some tags"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{name: "some updated name", about: "some updated about", is_active: false, picture: "some updated picture", price: 43, tags: "some updated tags"}

      assert {:ok, %Product{} = product} = Products.update_product(product, update_attrs)
      assert product.name == "some updated name"
      assert product.about == "some updated about"
      assert product.is_active == false
      assert product.picture == "some updated picture"
      assert product.price == 43
      assert product.tags == "some updated tags"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end
end
