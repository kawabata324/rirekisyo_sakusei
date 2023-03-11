class PersonalHistories::PdfsController < PersonalHistories::ApplicationController
  PDF_FONT_PATH = 'app/assets/fonts/ipaexm.ttf'

  def index
    pdf = SamplePdf.new(personal_history: @personal_history)
    # TODO: https://medium.com/@sushantbajracharya/rails-api-and-prawn-gem-a11e4926f228
    # フロントに送る時は上記を参考にする
    send_data pdf.render,
              filename: "#{@personal_history.name}.pdf",
              type: "application/pdf",
              disposition: "inline"
  end
end

class SamplePdf < Prawn::Document
  def initialize(personal_history:)
    super()
    @personal_history = personal_history
    @profile = @personal_history.profile
    @address = @personal_history.address
    @educational_back_grounds = @personal_history.format_back_grounds(back_grounds: @personal_history.educational_back_grounds)
    @license_back_grounds = @personal_history.format_back_grounds(back_grounds: @personal_history.license_back_grounds)
    @programing_back_grounds = @personal_history.format_back_grounds(back_grounds: @personal_history.programing_back_grounds)
    @internship_back_grounds = @personal_history.format_back_grounds(back_grounds: @personal_history.internship_back_grounds)
    @self_content = @personal_history.self_content
    font PersonalHistories::PdfsController::PDF_FONT_PATH
    move_down 10
    # 履歴書タイトル
    create_title
    # プロフィール
    create_profile
    # 住所
    create_address
    move_down 10
    # 軌跡
    create_back_grounds(description_title: EducationalBackGround::DESCRIPTION_TITLE, back_grounds: @educational_back_grounds)
    move_down 10
    create_back_grounds(description_title: LicenseBackGround::DESCRIPTION_TITLE, back_grounds: @license_back_grounds)
    move_down 10
    create_back_grounds(description_title: ProgramingBackGround::DESCRIPTION_TITLE, back_grounds: @programing_back_grounds)
    move_down 10
    create_back_grounds(description_title: InternshipBackGround::DESCRIPTION_TITLE, back_grounds: @internship_back_grounds)
    move_down 10
    # 自己PR
    create_self_content
  end

  def create_title
    table([
            [
              make_cell(content: '履  歴  書', width: 200, align: :left, size: 18),
              make_cell(content: "#{I18n.l(@personal_history.updated_on, format: :long)} 現在", width: 200, align: :right, size: 10, valign: :bottom)
            ]
          ], width: 400) do
      row(0).borders = []
    end
  end

  def create_profile
    age_box = [
      make_cell(content: '', width: 60),
      make_cell(content: "#{@profile.format_birthdate} #{@profile.format_age}", width: 340, align: :left, valign: :center),
      make_cell(content: '', width: 30, align: :left, valign: :center),
      make_cell(content: '', width: 90, align: :left, valign: :center)
    ]

    kana_box = [
      make_cell(content: 'ふりがな', width: 60),
      make_cell(content: "#{@profile.first_name_kana} #{@profile.last_name_kana}", width: 340, align: :left, valign: :center),
      make_cell(content: '', width: 30, align: :left, valign: :center),
      make_cell(content: '', width: 90, align: :left, valign: :center)
    ]

    name_box = [
      make_cell(content: '名前', width: 60),
      make_cell(content: "#{@profile.first_name} #{@profile.last_name}", width: 340, height: 40, align: :left, valign: :center, size: 20),
      make_cell(content: '', width: 30, align: :left, valign: :center),
      # TODO 写真ができたら実装する
      make_cell(content: ' 写真 ', width: 90, height: 40, align: :center, valign: :center, size: 20)
    ]

    data = [
      kana_box,
      name_box,
      age_box
    ]

    table(data, position: :left, width: 520) do
      row(0).column(0).borders = [:top, :left]
      row(0).column(1).borders = [:right, :top]
      row(0).column(2).borders = []
      row(0).column(3).borders = [:top, :left, :right]
      row(1).column(0).borders = [:top, :left]
      row(1).column(1).borders = [:top, :right]
      row(1).column(2).borders = []
      row(1).column(3).borders = [:left, :right]
      row(2).column(0).borders = [:left, :top]
      row(2).column(1).borders = [:right, :top]
      row(2).column(2).borders = []
      row(2).column(3).borders = [:bottom, :left, :right]
      row(1).border_lines = [:dashed, :solid, :solid, :solid]
    end
  end

  def create_address
    address_kana_box = [
      make_cell(content: 'ふりがな', width: 60),
      make_cell(content: @address.content_kana, width: 320, align: :left),
      make_cell(content: "電話 #{@profile.format_phone_number}", width: 170),
    ]

    postal_code_box = [
      make_cell(content: '現住所', width: 60),
      make_cell(content: "〒 #{@address.format_postal_code}", width: 320, align: :left),
      make_cell(content: 'Email', width: 170),
    ]

    address_box = [
      make_cell(content: '', width: 60),
      make_cell(content: @address.content, width: 320, height: 60, align: :left, valign: :center, size: 18),
      make_cell(content: @profile.email, width: 170),
    ]

    table([
            address_kana_box,
            postal_code_box,
            address_box
          ], width: 550) do
      row(0).column(0).borders = [:top, :left]
      row(0).column(1).borders = [:right, :top]
      row(1).column(0).borders = [:top, :left]
      row(1).column(1).borders = [:top, :right]
      row(1).column(2).borders = [:right, :top]
      row(2).column(0).borders = [:left, :bottom]
      row(2).column(1).borders = [:right, :bottom]
      row(2).column(2).borders = [:right, :bottom]
      row(1).border_lines = [:dashed, :solid, :solid, :solid]
    end
  end

  def create_back_grounds(description_title:, back_grounds:)
    toc_box = [
      make_cell(content: '年', width: 60, align: :center),
      make_cell(content: '月', width: 40, align: :center),
      make_cell(content: description_title, width: 450, align: :center),
    ]

    back_ground_boxes = back_grounds.map do |back_ground|
      [
        make_cell(content: "#{back_ground[:year]}", width: 60, height: 23, align: :center),
        make_cell(content: "#{back_ground[:month]}", width: 40, align: :center),
        make_cell(content: back_ground[:description], width: 450, align: :left),
      ]
    end

    table([
            toc_box,
            *back_ground_boxes,
          ], width: 550) do
      row(0).column(0).borders = [:top, :left, :right]
      row(0).column(1).borders = [:right, :top]
      row(1).column(0).borders = [:top, :bottom, :left, :right]
      row(1).column(1).borders = [:top, :bottom]
      row(1).border_lines = [:solid, :solid, :solid, :solid]
    end
  end

  def create_self_content
    self_content_box_title = [
      make_cell(content: SelfContent::TITLE, width: 550, align: :left)
    ]
    self_content_box = [
      make_cell(content: @self_content, width: 550, height: 400, align: :left)
    ]
    table([
            self_content_box_title,
            self_content_box
          ], width: 550) do
      row(0).column(0).borders = [:top, :left, :right]
      row(1).column(0).borders = [:bottom, :left, :right]
      row(1).border_lines = [:solid, :solid, :solid, :solid]
    end
  end
end
