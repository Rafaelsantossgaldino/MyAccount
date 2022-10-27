module SmS
  class SendSms
    ACCOUNT_SID = ENV['TWILLIO_ACCOUNT_SID']
    AUTH_TOKEN = ENV['TWILLIO_AUTH_TOKEN']

    attr_accessor :params, :phone, :name_bank, :agency, :num_account, :balance

    def self.run(params)
      new(params).run
    end

    def initialize(params)
      @params = params
      @phone = "+55#{params["phone"]}"
      @name_bank = params["name_bank"]
      @agency = params["agency"]
      @num_account = params["num_account"]
      @balance = params["balance"]
    end

    def run
      process
    end

    private

    def message
      "MyAccount-API \n Banco criado com sucesso! \n Nome do banco: #{name_bank} \n Agencia: #{agency} \n Numero da conta: #{num_account} \n Saldo inicial da conta: #{balance}"
    end

    def process
      begin
        client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
        message = client.api.account.messages.create(from: ENV["TWILLIO_PHONE_NUMBER"], body: message, to: @phone)
        return true
      rescue Twilio::REST::TwilioError => e
        puts e.message
      end
    end
  end
end
