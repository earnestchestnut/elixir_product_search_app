defmodule ProductSearchApp.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :about, :text
      add :is_active, :boolean, default: false, null: false
      add :name, :text
      add :picture, :text
      add :price, :integer
      add :tags, :text

      timestamps()
    end
  end
end
