
if node['maven']['dependencies'].any?
  node['maven']['dependencies'].each do |dependency|
    maven dependency["artifact_id"] do
      group_id dependency["group_id"]
      version dependency["version"]
      dest node['maven']['destination']
      packaging dependency['packaging']
      update dependency['update']
    end
  end
end
