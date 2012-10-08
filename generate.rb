#!/usr/bin/ruby

lines = File.readlines 'Font-Awesome/less/font-awesome.less'
icons = lines.select { |line| line.start_with? ".icon-" }
icons = icons.map { |line| line.split(':')[0].sub ".", "" }
icons = icons.select { |icon| icon != "icon-large" }

File.open("cheatsheet.html", "w") { |out|
	out.puts <<EOS
<!-- Generated by Font Awesome cheatsheet generator by Michal Pokorny -->
<!-- http://github.com/MichalPokorny/Font-Awesome-cheatsheet -->
<!DOCTYPE html>
<html>
	<head>
		<title>Font Awesome cheatsheet</title>
		<link rel="stylesheet" href="Font-Awesome/css/font-awesome.css">
		<link rel="stylesheet" href="cheatsheet.css">
	</head>

	<body>
		<ul>
EOS
	for icon in icons
		out.puts "\t\t\t<li><i class=\"#{icon}\"></i><span>#{icon.sub "icon-", ""}</span></li>"
	end
	out.puts <<EOS
		</ul>
	</body>
</html>
EOS
}

