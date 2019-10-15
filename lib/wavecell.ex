defmodule Wavecell do
  @moduledoc """
  Documentation for Wavecell.
  """

  alias Wavecell.Api.Sms
  alias Wavecell.Auth

  @parser Application.get_env(:wavecell, :parser)

  @doc """
  Send simple sms
  """
  def send_sms(params) do
    Auth.get_credentials()
    |> Sms.send(params)
    |> @parser.parse(:send_sms)
  end
end
