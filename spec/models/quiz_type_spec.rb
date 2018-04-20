require 'rails_helper'

RSpec.describe QuizType, type: :model do

  it 'es inválido si no tiene un nombre' do
    quiz_type = QuizType.new(nombre: nil)
    expect(quiz_type).not_to be_valid
  end

  it 'es válido si tiene un nombre' do
    quiz_type = QuizType.new(nombre: FFaker::Lorem.word)
    expect(quiz_type).to be_valid
  end

end
