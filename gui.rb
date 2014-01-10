begin
	require "tk"
	TkButton.new(nil,'text'=>'hello',
				'command'=>proc{p "hello world\n"}).pack('fill'=>'x')
	TkButton.new(nil,'text'=>'exit',
				'command'=>proc{exit}).pack('fill'=>'x')


	Tk.mainloop



rescue Exception => e
	p e
end

gets "exit"