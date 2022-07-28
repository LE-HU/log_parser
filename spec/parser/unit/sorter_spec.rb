# frozen_string_literal: true

describe Parser::Sorter do
  describe '#call' do
    let(:views) do
      {
        '/contact' => 1,
        '/about/2' => 1,
        '/help_page/1' => 2
      }
    end

    let(:sorted_views) do
      [
        ['/help_page/1', 2],
        ['/contact', 1],
        ['/about/2', 1]
      ]
    end

    it 'returns hash sorted by values descending' do
      expect(described_class.new(views: views).call).to eq(sorted_views)
    end
  end
end
