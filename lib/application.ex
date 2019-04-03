defmodule Paperwork.Application do
    use Application

    def start(_type, _args) do
        case Code.ensure_loaded(ExSync) do
            {:module, ExSync = mod} ->
                mod.start()
            {:error, :nofile} ->
                :ok
        end

        children = [
            Paperwork.Server,
            {Mongo, [name: :mongo, database: "configs", pool: DBConnection.Poolboy]}
        ]

        opts = [strategy: :one_for_one, name: Paperwork.Supervisor]
        Supervisor.start_link(children, opts)
    end
end
