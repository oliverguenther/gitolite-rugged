require 'spec_helper'

describe Gitolite::GitoliteAdmin do

  output_dir = '/tmp'
  # output_dir = File.join(File.dirname(File.dirname(__FILE__)), 'tmp')

  describe '#bootstrap' do
    it 'should bootstrap a gitolite-admin repository' do
      test_dir = File.join(output_dir, 'gitolite-admin-test')
      opts = { :overwrite => false }
      gl_admin = GitoliteAdmin.bootstrap(test_dir, opts)

      expect(gl_admin).to be_a Gitolite::GitoliteAdmin
      expect(GitoliteAdmin.is_gitolite_admin_repo?(test_dir)).to be true
    end

    it 'should bootstrap (overwrite) a gitolite-admin repository' do
      test_dir = File.join(output_dir, 'gitolite-admin-test')
      opts = { :overwrite => true }
      gl_admin = GitoliteAdmin.bootstrap(test_dir, opts)

      expect(gl_admin).to be_a Gitolite::GitoliteAdmin
      expect(GitoliteAdmin.is_gitolite_admin_repo?(test_dir)).to be true
    end
  end

  describe '#is_gitolite_admin_repo?' do
    it 'should detect a non gitolite-admin repository' do
      test_dir = output_dir
      expect(GitoliteAdmin.is_gitolite_admin_repo?(test_dir)).to be false
    end
  end

end
