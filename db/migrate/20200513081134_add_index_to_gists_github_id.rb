class AddIndexToGistsGithubId < ActiveRecord::Migration[6.0]
  def change
    add_index :gists, :github_id, unique: true
  end
end
