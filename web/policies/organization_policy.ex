defmodule CodeCorps.OrganizationPolicy do
  import CodeCorps.Helpers.Policy,
    only: [organization_owned_by?: 2]

  alias CodeCorps.User
  alias CodeCorps.Organization

  def create?(%User{admin: true}), do: true
  def create?(%User{admin: false}), do: false

  def update?(%User{admin: true}, %Organization{}), do: true
  def update?(%User{} = user, %Organization{} = organization), do: organization |> organization_owned_by?(user)
end
