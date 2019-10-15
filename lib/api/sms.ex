defmodule Wavecell.Api.Sms do
  @moduledoc """
  Apis to handle Wavecell SMS´s api
  """


  def send({subaccount_id, auth_header}, params) do
    WavecellRequest.post!(
      "/sms/v1/#{subaccount_id}/single",
      params,
      [auth_header]
    )
  end
end
