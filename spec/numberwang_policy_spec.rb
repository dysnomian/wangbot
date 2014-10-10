describe Wangbot::NumberwangPolicy do

  let(:policy) { Wangbot::NumberwangPolicy }
  let(:interwang) { policy.INTERWANG_CONSTANT }
  let(:number) { 91 }

  describe "#evaluate_numberwang" do
    let(:evaluate) { policy.evaluate_numberwang(number) }

    context "when number is Luhn valid"
    context "when number is binarywang"
    context "when number is dammwang"
    context "when number is Verhoeefwang and Dammwang"

    context "when the number is pseudowang" do
      let(:number) { 6 }

      before { evaluate }

      it "sets the number to 8" do
        expect(policy.number).to eq(8)
      end

    end

    context "when the number is wrong" do
      let(:number) { 8 }

      it "rotates" do
        expect(policy).to_receive(:rotate)
        evaluate
      end
    end

  end
end
