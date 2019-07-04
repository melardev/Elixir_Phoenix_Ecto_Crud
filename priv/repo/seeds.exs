alias ApiPhoenixCrud.Repo
alias ApiPhoenixCrud.Todos.Todo
import Ecto.Query

# todosInDb = Repo.one(from p in "todos", select: count(p.id))
todosInDb = Repo.aggregate(from(t in "todos"), :count, :id)
# Db Specific
# todosInDb = Repo.one(from p in "todos", select: fragment("count(*)"))

itemsToSeed = 40 - todosInDb

if itemsToSeed > 0 do
  IO.puts "Seeding #{itemsToSeed} items"
  Enum.each(0..itemsToSeed, fn(x) ->
    title = Faker.Lorem.word()
    description = FakerElixir.Lorem.sentences(2..5)
    # description = Enum.join(Faker.Lorem.sentences(2), ". ")
    completed = FakerElixir.Boolean.boolean(0.5)
    # created_at = DateTime.to_naive(Faker.DateTime.backward(4))
    created_at = DateTime.to_naive(DateTime.from_iso8601(FakerElixir.Date.backward(0..365)) |> elem(1))
    updated_at = DateTime.to_naive(DateTime.from_iso8601(FakerElixir.Date.backward(0..365)) |> elem(1))

    IO.puts description
    Repo.insert! %Todo{title: title,
      description: description,
      completed: completed,
      created_at: created_at,
      updated_at: updated_at}
  end)
end



