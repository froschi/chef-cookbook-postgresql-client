include_recipe "libpq"
include_recipe "libssl"
include_recipe "postgresql-client-common"

packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "libreadline"

  packages |= %w/
    postgresql-client-8.4
  /
when "precise"
  include_recipe "libedit"

  packages |= %w/
    postgresql-client-9.1
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
