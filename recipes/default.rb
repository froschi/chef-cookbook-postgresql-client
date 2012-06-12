packages = Array.new

case node[:lsb][:codename]
when "lucid"
  packages |= %w/
    postgresql-client-8.4
  /
when "precise"
  packages |= %w/
    postgresql-client-8.4
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
