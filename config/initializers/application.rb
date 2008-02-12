ActionView::Base.default_form_builder = Slate::FormBuilder

Audit.send :acts_as_ferret, :fields => [:comments]