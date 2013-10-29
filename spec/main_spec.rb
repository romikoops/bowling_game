require 'spec_helper'
require_relative '../lib/bowling_game'

describe "#score" do
  subject { BowlingGame.score }
  before { BowlingGame.rolls = rolls }

  context "when no one pin knocked down on each roll" do
    let(:rolls) { [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
    it { expect(subject).to eql({1=>0, 2=>0, 3=>0, 4=>0, 5=>0, 6=>0, 7=>0, 8=>0, 9=>0, 10=>0}) }
  end

  context "when single pin knocked down on each roll" do
    let(:rolls) { [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1] }
    it { expect(subject).to eql({1=>2, 2=>4, 3=>6, 4=>8, 5=>10, 6=>12, 7=>14, 8=>16, 9=>18, 10=>20}) }
  end

  context "when spare in first frame and 5 in next roll" do
    let(:rolls) { [7, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
    it { expect(subject).to eql({1=>15, 2=>20, 3=>20, 4=>20, 5=>20, 6=>20, 7=>20, 8=>20, 9=>20, 10=>20}) }
  end

  context "when spare in last frame and 5 in bonus roll" do
    let(:rolls) { [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 5] }
    it { expect(subject).to eql({1=>0, 2=>0, 3=>0, 4=>0, 5=>0, 6=>0, 7=>0, 8=>0, 9=>0, 10=>15}) }
  end

  context "when strike in first roll and 5 in next roll" do
    let(:rolls) { [10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
    it { expect(subject).to eql({1=>18, 2=>26, 3=>26, 4=>26, 5=>26, 6=>26, 7=>26, 8=>26, 9=>26, 10=>26}) }
  end

  context "when 5, 3, strike and 5 in next roll" do
    let(:rolls) { [5, 3, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] }
    it { expect(subject).to eql({1=>8, 2=>26, 3=>34, 4=>34, 5=>34, 6=>34, 7=>34, 8=>34, 9=>34, 10=>34}) }
  end

  context "when data from task description" do
    let(:rolls) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }
    it { expect(subject).to eql({1=>5, 2=>14, 3=>29, 4=>49, 5=>60, 6=>61, 7=>77, 8=>97, 9=>117, 10=>133}) }
  end

  context "when all strikes" do
    let(:rolls) { [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] }
    it { expect(subject).to eql({1=>30, 2=>60, 3=>90, 4=>120, 5=>150, 6=>180, 7=>210, 8=>240, 9=>270, 10=>300}) }
  end

  context "when all 5" do
    let(:rolls) { [5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5] }
    it { expect(subject).to eql({1=>15, 2=>30, 3=>45, 4=>60, 5=>75, 6=>90, 7=>105, 8=>120, 9=>135, 10=>150}) }
  end
end