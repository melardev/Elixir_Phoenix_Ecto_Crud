defmodule ApiPhoenixCrud.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :description, :text
      add :completed, :boolean, default: false, null: false

      timestamps(inserted_at: :created_at)
    end

  end
end
