class MigrateBlogDetialsToActionText < ActiveRecord::Migration[6.1]

    def change
      rename_column :blogs, :detials, :detials_old
      Blog.all.each do |blog|
        blog.update_attribute(:detials,(blog.detials_old))
      end
      remove_column :blogs, :detials_old
    
  end
end
