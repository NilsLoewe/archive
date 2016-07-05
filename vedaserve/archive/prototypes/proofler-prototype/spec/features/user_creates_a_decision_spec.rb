feature 'User creates a decision spec' do
  scenario 'they have to fill in initial information' do
    visit new_decision_path

    fill_in 'decision_title', with: 'What movie should we watch?'
    fill_in 'decision_author', with: 'Hans'
    fill_in 'decision_email', with: 'hans@betterdecisions.invalid'

    click_button 'Weiter'

    last_decision = Decision.all.last
    expect(last_decision.title).to eql('What movie should we watch?')
    expect(last_decision.author).to eql('Hans')
    expect(last_decision.email).to eql('hans@betterdecisions.invalid')
  end

  scenario 'they can specify an initial options' do
    decision = create(:decision)
    visit options_decision_path(decision.id)

    fill_in 'option_title', with: 'Mockingjay'
    click_button 'ok'

    expect(page).to have_content 'Mockingjay'
    expect(decision.options.count).to be(1)
  end

  scenario 'they are able to specify more than on option' do
    decision = create(:decision_with_option)
    visit options_decision_path(decision.id)

    pending "currently there is some javascript magic that capybara can't trigger"
    expect(page).to have_content 'Lege eine weitere Option an'
  end
end
