# Class with methods used to compare secret sequence with user sequence
# Will be used to used to generate required feedback
class Comparator
  def compare_common_colors(secret_sequence, user_sequence)
    secret_sequence & user_sequence
  end

  def compare_right_positions(secret_sequence, user_sequence)
    count = 0
    secret_sequence.each_with_index do |color, index|
      count += 1 if color == user_sequence[index]
    end
    count
  end
end
