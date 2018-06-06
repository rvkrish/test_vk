require "byebug"
describe 'page related tests' , type: :feature do

    feature 'Page operations' do
        scenario 'Create new page' do  
            visit("http://web:3001/")
            click_link("New Product")
            fill_in("product_name",with: "Name")
            save_and_open_screenshot
            fill_in("product_price",with: 20)
            find('[name=commit]').click
            puts "-----------#{Product.count}---------"
            expect(page).to have_css('#notice') 
        end
    end
end