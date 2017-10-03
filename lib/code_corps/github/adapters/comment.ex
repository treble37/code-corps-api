defmodule CodeCorps.GitHub.Adapters.Comment do
  @moduledoc """
  Used to adapt a GitHub payload into attributes for creating or updating
  a `CodeCorps.Comment`.
  """

  alias CodeCorps.Comment

  @mapping [
    {:created_at, ["created_at"]},
    {:github_id, ["id"]},
    {:markdown, ["body"]},
    {:modified_at, ["updated_at"]}
  ]

  @spec from_api(map) :: map
  def from_api(%{} = payload) do
    payload |> CodeCorps.Adapter.MapTransformer.transform(@mapping)
  end

  @autogenerated_github_keys ~w(created_at id updated_at)

  @spec to_api(Comment.t) :: map
  def to_api(%Comment{} = comment) do
    comment
    |> Map.from_struct
    |> CodeCorps.Adapter.MapTransformer.transform_inverse(@mapping)
    |> Map.drop(@autogenerated_github_keys)
  end
end
