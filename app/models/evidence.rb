class Evidence < ApplicationRecord
  belongs_to :case
  has_one_attached :file

  validates :original_filename, :mime_type, :size_bytes,
            :sha256, :file_type, :mode, :uid, :gid,
            presence: true

  validates :sha256, format: { with: /\A[a-f0-9]{64}\z/ }

  before_update :prevent_modification
  before_destroy :prevent_deletion

  def to_param
    id
  end

  private

  def prevent_modification
    raise ActiveRecord::ReadOnlyRecord, "Evidence is immutable"
  end

  def prevent_deletion
    raise ActiveRecord::ReadOnlyRecord, "Evidence cannot be deleted"
  end
end
