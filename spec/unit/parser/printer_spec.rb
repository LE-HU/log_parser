# frozen_string_literal: true

describe Parser::Printer do
  describe '#print' do
    let(:sorted_views) do
      [
        ['/help_page/1', 2],
        ['/contact', 1],
        ['/about/2', 1]
      ]
    end

    describe 'when no options provided' do
      it 'prints list of all views' do
        expect { described_class.new(data: sorted_views, uniq: nil).print }
          .to output(/List of webpages with most views/).to_stdout
      end
    end

    describe 'when uniq option provided' do
      it 'prints list of uniq views' do
        expect { described_class.new(data: sorted_views, uniq: true).print }
          .to output(/List of webpages with most unique views/).to_stdout
      end
    end
  end
end
