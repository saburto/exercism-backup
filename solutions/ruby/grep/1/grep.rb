class Grep
  def self.grep(pattern, flags, files)
    result = ""
    files.each do |file|
      lines = File.readlines(file)
      lines.each_with_index do |line, index|

        options = "i" if flags.include?("-i")

        if flags.include?("-x")
          if flags.include?("-i")
            pattern = /^#{pattern}$/i
          else
            pattern = /^#{pattern}$/
          end
        end

        file_pre = files.size > 1 ? "#{file}:" : ""
        if line.match?(Regexp.new(pattern, options))

          pre = file_pre.dup
          if flags.include?("-n")
            pre += "#{index + 1}:"
          end

          if flags.include?("-l")
            result += "#{file}\n" unless result.include?(file)
          else
            result += "#{pre}#{line}" unless flags.include?("-v")
          end
        else
          if flags.include?("-v")
            result += "#{file_pre}#{line}"
          end
        end
      end
    end

    result.strip
  end
end
