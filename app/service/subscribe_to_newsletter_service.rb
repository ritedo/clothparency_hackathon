require "gibbon"

class SubscribeToNewsletterService
  def initialize(user)
    @user = user
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @list_id = ENV['MAILCHIMP_LIST_ID']
  end

  def call
    member_id = Digest::MD5.hexdigest(@user.email)
    begin
      member_info = @gibbon.lists(@list_id).members(member_id).retrieve.body[:status]
      categories_names = @user.categories.map { |category| category.name }
      categories_names_listed = categories_names.nil? ? "" : categories_names.join(",")
      brands_names = @user.brands.map { |brand| brand.name }
      brands_names_listed = brands_names.nil? ? "" : brands_names.join(",")
      @gibbon.lists(@list_id).members(member_id).update(body: { merge_fields: {CATEGORIES: categories_names_listed, BRANDS: brands_names_listed}})

    rescue
      categories_names = @user.categories.map { |category| category.name }
      categories_names_listed = categories_names.nil? ? "" : categories_names.join(",")
      brands_names = @user.brands.map { |brand| brand.name }
      brands_names_listed = brands_names.nil? ? "" : brands_names.join(",")
      @gibbon.lists(@list_id).members.create(body: { email_address: @user.email, status: 'subscribed', double_optin: false, merge_fields: {CATEGORIES: categories_names_listed, BRANDS: brands_names_listed} })
    end
  end
end
