
module Filterable
    extend ActiveSupport::Concern

    module ClassMethods
        def filter filtering_params

            return self.all if filtering_params.empty?

            if filtering_params["case_type_id"]
            results = self.includes(:case_type_id).where(case_type_id: { name: filtering_params["case_type_id"] })

          elsif filtering_params["amount"]
              min = filtering_params["amount"].split('-').first
              max = filtering_params["amount"].split('-').last
              results = self.where("amount >= :min AND amount <= :max", min: min, max: max)

          end
          results
        end
    end
end