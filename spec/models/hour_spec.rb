require 'rails_helper'

RSpec.describe Hour, type: :model do

  it 'es inválido sin hora de inicio' do
    hour = Hour.new({
        hora_inicio: nil,
        hora_fin: FFaker::Time.datetime
                    })
    expect(hour).not_to be_valid
  end

  it 'es invalido sin hora de fin' do
    hour = Hour.new({
                        hora_inicio: FFaker::Time.datetime,
                        hora_fin: nil
                    })
    expect(hour).not_to be_valid
  end

  it 'es válido con hora de inicio y hora de fin' do
    hour = Hour.new({
                        hora_inicio: FFaker::Time.datetime,
                        hora_fin: FFaker::Time.datetime
                    })
    expect(hour).to be_valid
  end

end
