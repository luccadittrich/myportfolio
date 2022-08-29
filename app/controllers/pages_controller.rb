require "prawn"
class PagesController < ApplicationController
  def index

  end

  def download_pdf
    send_file(
      "#{Rails.root}/public/Lucca.dittrich.dev.pdf",
      filename: "Lucca.dittrich.dev.pdf",
      type: "application/pdf"
    )
  end

  private

  def generate_pdf(client)
    Prawn::Document.new do
      text client.name, align: :center
      text "Address: #{client.address}"
      text "Email: #{client.email}"
    end.render
  end

end
