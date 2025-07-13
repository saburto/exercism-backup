class Transpose
  def self.transpose(text)

    lines = text.split(/\n/)

    out = []

    lines.each_with_index do |input, index|
      ch_arr = input.chars

      ch_arr.each_with_index do |c, i|

        col = out.fetch(i, "")
        if col.size < index
          col += (" " * (index - col.size))
        end

        col += c
        out[i] = col
      end
    end

    out.join("\n")
  end
end
