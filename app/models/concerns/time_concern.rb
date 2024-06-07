module TimeConcern
    extend ActiveSupport::Concern
  
    def creation_time
      created_at.strftime("%B %d, %Y %H:%M:%S")
    end
  end
  