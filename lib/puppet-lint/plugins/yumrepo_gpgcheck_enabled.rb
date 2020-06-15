PuppetLint.new_check(:yumrepo_gpgcheck_enabled) do
  def check
    resource_indexes.each do |resource|
      next unless resource[:type].value == 'yumrepo'

      # if the gpgcheck value doesn't exist then warn and return early.
      if resource[:param_tokens].select { |pt| pt.value == 'gpgcheck' }.empty?

        notify :warning, {
          message: 'yumrepo should have the gpgcheck attribute',
          line:    resource[:type].line,
          column:  resource[:type].column,
        }

      else # we have at least one gpgcheck - check it's enabled

        resource[:param_tokens].select { |param_token|
          param_token.value == 'gpgcheck'
        }.each do |content_token|
          setting = content_token.next_code_token.next_code_token

          # skip if valid. we only care about broken settings.
          next if ['true', 1, '1', 'yes'].include? setting.value

          notify :warning, {
            message: 'yumrepo should enable the gpgcheck attribute',
            line:    setting.line,
            column:  setting.column,
          }

        end
      end
    end
  end
end
