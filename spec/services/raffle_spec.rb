# frozen_string_literal: true

RSpec.describe Raffle do
  subject(:service) { described_class }

  let(:campaign) { create(:campaign, status: :pending) }

  describe '#call' do
    context 'when has more then two members' do
      before { campaign.members = build_list(:member, 5) }

      let(:relations) { service.call(campaign: campaign) }

      it 'is a hash' do
        expect(relations.class).to eq(Hash)
      end

      it 'members are in relations as a member' do
        result_members = relations.map(&:first)
        expect(result_members.sort).to eq(campaign.members.sort)
      end

      it 'member are in relations as a friend' do
        result_friends = relations.map(&:last)
        expect(result_friends.sort).to eq(campaign.members.sort)
      end

      it "member don't get yourself" do
        relations.each do |member, secret_frield|
          expect(member).not_to eq(secret_frield)
        end
      end

      it "member x don't get a member y that get the member x" do
        expect(relations.to_a & relations.invert.to_a).to be_empty
      end
    end

    context "when don't has more then two members" do
      before { campaign.members = build_list(:member, 2) }

      let(:relations) { service.call(campaign: campaign) }

      it 'raise error' do
        expect(relations).to be(false)
      end
    end
  end
end
