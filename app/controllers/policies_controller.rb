# frozen_string_literal: true

class PoliciesController < ApplicationController
  def show
    policy = Policy.find(params[:id])
    full_policy_data = policy.attributes.merge(
      insured: policy.insured.attributes,
      vehicle: policy.vehicle.attributes
    )

    render status: :ok, json: full_policy_data.to_json
  end
end
