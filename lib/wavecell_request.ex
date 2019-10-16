defmodule WavecellRequest do
  @moduledoc """
  Handle all Wavecell requests
  """

  use HTTPoison.Base

  @endpoint "https://api.wavecell.com"
  @default_headers [{"Content-Type", "application/json"}]

  def process_request_url(url) do
    @endpoint <> url
  end

  def process_request_body(body) do
    Jason.encode!(body)
  end

  def process_request_headers(headers \\ []) do
    headers ++ @default_headers
  end

  def process_response_body(body) do
    with {:ok, response} <- Jason.decode(body) do
      response
    end
  end
end
