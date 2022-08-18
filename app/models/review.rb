class Review < ApplicationRecord
  enum sex: { male: 0, female: 1, unknown: 2}
  enum sale_count: { first: 0, second: 1, more: 2 }
  enum contract_type: { exclusive_fulltime: 0, fulltime: 1, general: 2, unknown: 3 }
  enum sale_reason: { migration: 0, inheritance: 1, relocation: 2, divorce: 3, asset: 4, financial: 5, other: 6 }
  belongs_to :property_type
end
