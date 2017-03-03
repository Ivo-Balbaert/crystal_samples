{% if flag?(:x86_64) %}
  # some specific code for 64 bits platforms
{% else %}
  # some specific code for non-64 bits platforms
{% end %}

{% if flag?(:linux) && flag?(:x86_64) %}
  # some specific code for linux 64 bits
{% end %}

# used in C bindings
# definition of size_t type:
lib C
  {% if flag?(:x86_64) %}
    alias SizeT = UInt64
  {% else %}
    alias SizeT = UInt32
  {% end %}
end

