# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Campaigns', type: :request do
  before do
    @current_user = create(:user)
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/campaigns/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    context 'campaing exists' do
      context 'User is the owner of the campaing' do
        it 'Returns success' do
          campaign = create(:campaign, user: @current_user)
          get '/campaigns/show', params: { id: campaign.id }
          expect(response).to have_http_status(:success)
        end
      end

      context 'User is not the owner of the campaign' do
        it 'Redirects to root' do
          campaign = create(:campaign)
          get '/campaigns/show', params: { id: campaign.id }

          expect(response).to redirect_to('/')
        end
      end
    end

    context "campaign don't exists" do
      it 'Redirects to root' do
        get '/campaigns/show', params: { id: 0 }
        expect(response).to redirect_to('/')
      end
    end
  end

  describe 'POST /create' do
    before do
      @campaign_attributes = attributes_for(:campaign, user: @current_user)
      post '/campaigns/create', params: { campaign: @campaign_attributes }
    end

    it 'Redirect to new campaign' do
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to('/campaigns//{Campaign.last.id}')
    end

    it 'Create campaign with right attributes' do
      expect(Campaign.last.user).to eql(@current_user)
      expect(Campaign.last.title).to eql('Nova Campanha')
      expect(Campaign.last.description).to eql('Descreva sua campanha...')
      expect(Campaign.last.status).to eql('pending')
    end

    it 'Create campaign with owner associated as a member' do
      expect(Campaign.last.members.last.name).to eql(@current_user.name)
      expect(Campaign.last.members.last.email).to eql(@current_user.email)
    end
  end

  describe 'DELETE /destroy' do
    context 'User is the Campaign Owner' do
      it 'returns http success' do
        campaign = create(:campaign, user: @current_user)
        delete :destroy, params: { id: campaign.id }
        expect(response).to have_http_status(:success)
      end
    end

    context "User isn't the Campaign Owner" do
      it 'returns http forbidden' do
        campaign = create(:campaign)
        delete '/campaigns/destroy', params: { id: campaign.id }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'PUT /update' do
    before do
      @new_campaign_attributes = attributes_for(:campaign)
      # request.env['HTTP_ACCEPT'] = 'application/json'
    end

    context 'User is the Campaign Owner' do
      before do
        campaign = create(:campaign, user: @current_user)
        put '/campaigns/update',
            params: { id: campaign.id, campaign: @new_campaign_attributes }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'Campaign have the new attributes' do
        expect(Campaign.last.title).to eq(@new_campaign_attributes[:title])
        expect(Campaign.last.description).to eq(@new_campaign_attributes[:description])
      end
    end

    context "User isn't the Campaign Owner" do
      it 'returns http forbidden' do
        campaign = create(:campaign)
        put '/campaigns/update',
            params: { id: campaign.id, campaign: @new_campaign_attributes }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'GET /raffle' do
    context 'User is the Campaign Owner' do
      before do
        @campaign = create(:campaign, user: @current_user)
      end

      context 'Has more than two members' do
        before do
          create(:member, campaign: @campaign)
          create(:member, campaign: @campaign)
          create(:member, campaign: @campaign)
          post '/campaigns/raffle', params: { id: @campaign.id }
        end

        it 'returns http success' do
          expect(response).to have_http_status(:success)
        end
      end

      context 'No more than two members' do
        before do
          create(:member, campaign: @campaign)
          post '/campaigns/raffle', params: { id: @campaign.id }
        end

        it 'returns http success' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    context "User isn't the Campaign Owner" do
      before do
        @campaign = create(:campaign)
        post '/campaigns/raffle', params: { id: @campaign.id }
      end

      it 'returns http forbidden' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
