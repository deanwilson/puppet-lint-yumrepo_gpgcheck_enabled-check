require 'spec_helper'

describe 'yumrepo_gpgcheck_enabled' do
  context 'yumrepo with enabled gpgcheck' do
    let(:code) do
      <<-TEST_CLASS
        class yum_gpgenabled {
          yumrepo { 'company_app_repo':
            enabled  => 1,
            descr    => 'Local repo holding company application packages',
            baseurl  => 'http://repos.example.org/apps',
            gpgcheck => 1,
          }
        }
      TEST_CLASS
    end

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'yumrepo without gpgcheck attribute' do
    let(:absent_msg) { 'yumrepo should have the gpgcheck attribute' }

    let(:code) do
      <<-TEST_CLASS
        class yum_gpgenabled {
          yumrepo { 'company_app_repo':
            enabled  => 1,
            descr    => 'Local repo holding company application packages',
            baseurl  => 'http://repos.example.org/apps',
          }
        }
      TEST_CLASS
    end

    it 'should detect a problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning(absent_msg).on_line(2).in_column(11)
    end
  end

  context 'yumrepo with disabled gpgcheck' do
    let(:enable_msg) { 'yumrepo should enable the gpgcheck attribute' }

    let(:code) do
      <<-TEST_CLASS
        class yum_gpgenabled {
          yumrepo { 'company_app_repo':
            enabled  => 1,
            descr    => 'Local repo holding company application packages',
            baseurl  => 'http://repos.example.org/apps',
            gpgcheck => 0,
          }
        }
      TEST_CLASS
    end

    it 'should detect a problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning(enable_msg).on_line(6).in_column(25)
    end
  end
end
