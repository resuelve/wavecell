defmodule WavecellTest do
  use ExUnit.Case

  alias HTTPoison.Response
  import Mock

  @ok_response %{
    "umid" => "bda3d56d-1424-e711-813c-06ed3428fe67",
    "clientMessageId" => "1234",
    "destination" => "6590000001",
    "encoding" => "GSM7",
    "status" => %{
      "code" => "QUEUED",
      "description" => "SMS is accepted and queued for processing"
    }
  }

  test "Should send sms message" do
    with_mocks([
      {
        WavecellRequest,
        [],
        [
          post!: fn _, _, _ ->
            %Response{body: @ok_response}
          end
        ]
      }
    ]) do
      params = %{
        "source" => "Developer",
        "destination" => "+6512345678",
        "clientMessageId" => "MyBd00001",
        "text" => "Hello World",
        "encoding" => "AUTO",
        "scheduled" => "2016-11-03T08:24:20.332Z",
        "expiry" => "2016-11-03T18:24:20.332Z"
      }

      assert Wavecell.send_sms(params) == {:ok, @ok_response}
    end
  end
end
