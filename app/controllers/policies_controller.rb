# frozen_string_literal: true

class PoliciesController < ApplicationController
  def index
    policies = Policy.includes(:insured, :vehicle)
    return head :not_found if policies.blank?

    render json: policies, include: [:insured, :vehicle]
  end

  def show
    policy = Policy.includes(:insured, :vehicle).find_by(id: params[:id])
    return head :not_found if policy.nil?

    render json: policy, include: [:insured, :vehicle]
  end
end
