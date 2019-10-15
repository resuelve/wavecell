defmodule WavecellRequest do
  use HTTPoison.Base

  @default_headers [{"Content-Type", "application/json"}]

  def process_request_body(body) do
    Jason.encode!(body)
  end

  def process_request_headers(headers \\ []) do
    headers ++ @default_headers
  end

  def process_response_body(body) do
    Jason.decode!(body)
  end
end
