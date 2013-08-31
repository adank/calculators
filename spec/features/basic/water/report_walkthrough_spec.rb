require 'spec_helper'

describe "Basic Tool Walkthrough" do
  context 'when a guest user uses the calculator' do

    it 'starts the calculator', :js do
      start_calculator :water, :basic
      current_path.should == water_basic_path
    end

    it 'selects the country' do
      visit water_basic_path
      select 'COLOMBIA', from: 'country'
      click_button t('buttons.next')
      current_path.should == '/water_basic/water'
      basic_water[:country].should == "CO"
    end

    it 'selects the main water supply technology', :js do
      visit '/water_basic/water'
      pick_box 'boreHold_03'
      click_button t('buttons.next')
      current_path.should == '/water_basic/population'
      basic_water[:water].should == 3
    end

    it 'selects the population', :js  do
      visit '/water_basic/population'

      slider_handle = page.find('.ui-slider-handle')
      info_tab = page.find('.tab')
      slider_handle.drag_to(info_tab)

      click_button t('buttons.next')
      current_path.should == '/water_basic/capital'
      basic_water[:population].should == 1000000
    end

    # a more semantic approach to naming the session
    # could be named "report" too
    def basic_water
      basic_water_session
    end

    # click one of the typical boxes in the UI when selecting icons
    # @param label_name [String] the actual "class" for the label icon image
    # e.g. boreHold_03, waterTool << css class names
    def pick_box(label_name)
      find("label.#{label_name}").click
    end

  end

end
