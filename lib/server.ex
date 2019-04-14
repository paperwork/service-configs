defmodule Paperwork.Server do
    use Maru.Server, otp_app: :paperwork_service_configs

    def init(_type, opts) do
        Confex.Resolver.resolve(opts)
    end
end
