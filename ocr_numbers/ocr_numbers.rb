CIPHER_TO_DIGIT = {
  " _ | ||_|" => "0", " _| ||_|" => "0",
  "     |  |" => "1", "  |  |"   => "1",
  " _  _||_ " => "2", " _ _||_"  => "2",
  " _  _| _|" => "3", " _ _| _|" => "3",
  "   |_|  |" => "4", "|_|  |"   => "4",
  " _ |_  _|" => "5", " _|_ _|"  => "5",
  " _ |_ |_|" => "6", " _|_|_|"  => "6",
  " _   |  |" => "7", " _  |  |" => "7",
  " _ |_||_|" => "8", " _|_||_|" => "8",
  " _ |_| _|" => "9", " _|_| _|" => "9"
}

class OCR
  def initialize(text)
    @ocr_rows = text.split("\n\n")
  end

  def convert
    @ocr_rows.map do |ocr_row|
      numbers_per_row(ocr_row)
    end.join(",")
  end

private
  def numbers_per_row(ocr_row)
    numbers = build_numbers_from(ocr_row)
    numbers.reduce("") do |result, number|
      result << CIPHER_TO_DIGIT.fetch(number, "?")
    end
  end

  def build_numbers_from(ocr_row)
    numbers = []
    ocr_row.scan(/[^\n]+/) do |row|
      row.scan(/[ _|]{2,3}/).each_with_index do |str, i|
        numbers[i] ||= ""
        numbers[i] << str
      end
    end
    numbers
  end
end
