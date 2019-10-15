defmodule Wavecell.Auth do
  @moduledoc """
  Module helper to get auth credentials
  """

  @doc "Gets credentials from environment variables set in config"
  @spec get_credentials() :: tuple()
  def get_credentials() do
    subaccount_id = Application.get_env(:wavecell, :subaccount_id)
    api_key = Application.get_env(:wavecell, :api_key)
    auth_header = {"Authorization", "Bearer #{api_key}"}

    {subaccount_id, auth_header}
  end
end
