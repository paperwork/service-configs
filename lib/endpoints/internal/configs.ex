defmodule Paperwork.Configs.Endpoints.Internal.Configs do
    use Paperwork.Configs.Server
    use Paperwork.Helpers.Response

    pipeline do
    end

    namespace :internal do
        namespace :configs do
            route_param :key do
                get do
                    case Paperwork.Collections.Config.show(params[:key]) do
                        {:ok, config} ->
                            conn
                            |> resp({:ok, config})
                        {:notfound, nil} ->
                            conn
                            |> resp({:notfound, %{}})
                    end
                end
            end
        end
    end
end
