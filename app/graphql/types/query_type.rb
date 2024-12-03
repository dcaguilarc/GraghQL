# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Campo para obtener un nodo específico por su ID
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    # Campo para obtener una lista de nodos por sus IDs
    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Campo de ejemplo generado automáticamente
    field :test_field, String, null: false, description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    # Aquí agregamos el campo hello
    field :Hellow, String, null: false, description: "Devuelve un saludo"

    def Hellow
      "¡Hola Prueba GRAGH!"
    end
  end
end