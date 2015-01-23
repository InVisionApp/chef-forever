define :forever_service do

  template "/etc/init/#{params[:name]}.conf" do
    source "upstart.erb"
    cookbook "forever"
    owner params[:user]
    group params[:group]
    mode "0755"
    variables({
      :command => params[:command],
    })
  end

  service params[:name] do
    provider Chef::Provider::Service::Upstart
    supports :status => true, :restart => true
    action params[:action]
  end

end