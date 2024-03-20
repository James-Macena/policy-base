# frozen_string_literal: true

class PoliciesController < ApplicationController
  def index
    policies = Policy.includes(:insured, :vehicle)
    return render status: :not_found if policies.blank?

    render json: policies, include: [:insured, :vehicle]
  end

  def show
    policy = Policy.find_by(id: params[:id])
    return render status: :not_found if policy.nil?

    full_policy_data = policy.attributes.merge(
      insured: policy.insured.attributes,
      vehicle: policy.vehicle.attributes
    )

    render status: :ok, json: full_policy_data.to_json
  end
end
