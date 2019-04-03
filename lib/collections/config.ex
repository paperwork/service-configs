require Logger

defmodule Paperwork.Collections.Config do
    @collection "configs"
    @privates []
    @enforce_keys []
    @type t :: %__MODULE__{
        id: BSON.ObjectId.t() | nil,
        key: String.t(),
        value: String.t()
    }
    defstruct \
        id: nil,
        key: "",
        value: ""

    use Paperwork.Collections

    @spec show(key :: String.t) :: {:ok, %__MODULE__{}} | {:notfound, nil}
    def show("systemId" = key) do
        case collection_find(%__MODULE__{key: key}, :key) |> strip_privates do
            {:notfound, nil} -> create(%__MODULE__{key: key, value: UUID.uuid4()})
            found -> found
        end
    end

    @spec show(key :: String.t) :: {:ok, %__MODULE__{}} | {:notfound, nil}
    def show(key) when is_binary(key) do
        collection_find(%__MODULE__{key: key}, :key)
        |> strip_privates
    end

    @spec show(id :: BSON.ObjectId.t) :: {:ok, %__MODULE__{}} | {:notfound, nil}
    def show(%BSON.ObjectId{} = id) do
        show(%__MODULE__{:id => id})
    end

    @spec show(model :: __MODULE__.t) :: {:ok, %__MODULE__{}} | {:notfound, nil}
    def show(%__MODULE__{:id => _} = model) do
        collection_find(model, :id)
        |> strip_privates
    end

    @spec list() :: {:ok, [%__MODULE__{}]} | {:notfound, nil}
    def list() do
        %{}
        |> collection_find(true)
        |> strip_privates
    end

    @spec create(model :: __MODULE__.t) :: {:ok, %__MODULE__{}} | {:error, String.t}
    def create(%__MODULE__{} = model) do
        model
        |> collection_insert
        |> strip_privates
    end

    @spec update(model :: __MODULE__.t) :: {:ok, %__MODULE__{}} | {:error, String.t}
    def update(%__MODULE__{} = model) do
        model
        |> collection_update
        |> strip_privates
    end
end
