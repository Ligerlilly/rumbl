defmodule Rumbl.UserRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.User

  @valid_attrs %{name: "A User", username: "Bob"}

  test "converts unique_constraint on user name to error" do
    insert_user(username: "Steve")
    attrs = Map.put(@valid_attrs, :username, "Steve")
    changeset = User.changeset(%User{}, attrs)
    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, "has already been taken"} in changeset.errors
  end
end
