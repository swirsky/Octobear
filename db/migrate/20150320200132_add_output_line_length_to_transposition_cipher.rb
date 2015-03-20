class AddOutputLineLengthToTranspositionCipher < ActiveRecord::Migration
  def change
    add_column :transposition_ciphers, :output_line_length, :integer, null:false, default:25
  end
end
