# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'control-group', error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :prepend, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  config.wrappers :append, tag: 'div', class: "control-group", error_class: 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-inline' }
    end
  end

  1.upto(12) do |col|
    config.wrappers "inline_field#{col}".to_sym, tag: 'div', class: "col s#{col}", error_class: 'has-error' do |ic|
      ic.use :html5
      ic.use :placeholder
      ic.use :label, class: 'sr-only'
      ic.use :input, class: 'form-control'
      ic.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ic.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end

    config.wrappers "inline_bool#{col}".to_sym, tag: 'div', class: "col s#{col}", error_class: 'has-error' do |ib|
      ib.use :html5
      ib.optional :readonly

      ib.wrapper tag: 'div', class: 'checkbox' do |ba|
        ba.use :input
        ba.use :label
      end
      ib.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ib.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end
  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
