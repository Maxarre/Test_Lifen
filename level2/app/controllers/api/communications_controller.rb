class Api::CommunicationsController < ApplicationController
  def index
    # render json: Communication.all.to_json, status: :ok

    render json: Communication.includes(:practitioner).to_json, status: :ok
  end

  def create
    practitioner = Practitioner.where(first_name: communication_params[:first_name], last_name: communication_params[:last_name]).first

    communication = Communication.new(practitioner_id: practitioner.id, sent_at: communication_params[:sent_at])

    if communication.save
      render json: communication.to_json, status: :created
    end
  end

  def communication_params
    params.require(:communication).permit(:first_name, :last_name, :sent_at)
  end
end
