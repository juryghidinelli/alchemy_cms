# frozen_string_literal: true

module Alchemy
  module Admin
    class NodesController < Admin::ResourcesController
      def index
        @root_nodes = Node.language_root_nodes
      end

      def new
        @node = Node.new(
          site: Alchemy::Site.current,
          parent_id: params[:parent_id],
          language: Language.current
        )
      end

      private

      def resource_params
        params.require(:node).permit(
          :site_id,
          :parent_id,
          :language_id,
          :page_id,
          :name,
          :url,
          :title,
          :nofollow,
          :external
        )
      end
    end
  end
end
