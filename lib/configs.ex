defmodule Paperwork.Configs do
    use Paperwork
    use Paperwork.Configs.Server
    use Paperwork.Helpers.Response

    resources do
        get do
            json(conn, %{service: :paperwork_service_configs})
        end

        mount Paperwork.Configs.Endpoints.Internal.Configs
    end

    # TODO: Try to get rid of all this and define it within Paperwork.ex
    before do
        plug Plug.Logger
        plug Corsica, origins: "*"
        plug Plug.Parsers,
            pass: ["*/*"],
            json_decoder: Jason,
            parsers: [:urlencoded, :json, :multipart]
    end

    rescue_from Unauthorized, as: e do
        conn
        |> resp({:unauthorized, %{status: 1, content: %{message: e.message}}})
    end

    rescue_from [MatchError, RuntimeError], as: e do
        IO.inspect e

        conn
        |> resp({:error, %{status: 1, content: e}})
    end

    rescue_from Maru.Exceptions.InvalidFormat, as: e do
        IO.inspect e

        conn
        |> resp({:badrequest, %{status: 1, content: %{param: e.param, reason: e.reason}}})
    end

    rescue_from Maru.Exceptions.NotFound, as: e do
        IO.inspect e

        conn
        |> resp({:notfound, %{status: 1, content: %{method: e.method, route: e.path_info}}})
    end

    rescue_from :all, as: e do
        IO.inspect e

        conn
        |> resp({:error, %{status: 1, content: e}})
    end
end
