Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:55329 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760512Ab3D3MfU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Apr 2013 08:35:20 -0400
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com ([99.240.144.66]:44663 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1UX9mA-0007ZR-Ta
	for linux-kbuild@vger.kernel.org; Tue, 30 Apr 2013 08:35:19 -0400
Date: Tue, 30 Apr 2013 08:35:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: any interest these days in a Kconfig "maturity" level?
Message-ID: <alpine.DEB.2.02.1304300808570.16544@oneiric>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild list <linux-kbuild@vger.kernel.org>


  once upon a long time ago, i suggested extending kbuild with a whole
new qualifier, a "maturity level", and i still think that idea has
value since i don't think it would be hard to add, so let me throw it
out there again.

  the *concept* of a Kconfig variable maturity level is already
supported with the use of the dependency "EXPERIMENTAL", which i think
is a hideous abuse of dependencies. first, EXPERIMENTAL simply isn't a
dependency -- it's a subjective judgment about the danger of a Kconfig
setting. sadly, it was implemented as a dependency, which means that
not only is it mixed in with other *actual* dependencies, but there
are numerous Kconfig entries that *manually* add the string
"(EXPERIMENTAL)" at the end, making things even more aestheetically
hideous.

  instead of that, why not add a whole new Kconfig directive,
"maturity", as in:

config RDAY
	bool ...
	depends on ...
	maturity <some maturity setting here>

where the "maturity" setting is one of a small number of predefined
values. so what's the value of this?

  first, this would allow getting rid of all that "EXPERIMENTAL"
rubbish, which by itself justifies this new directive. :-) but wait,
there's more.

  next, this would be an entirely *optional* directive, so most of
kbuild could stay as it is. the default value would mean that this
variable is of normal maturity, nothing special about it.

  then you get to define a range of maturity settings that can be
applied to variables that represent their position in the normal life
cycle of Kconfig variables, such as:

  * OBSOLETE
  * DEPRECATED
  * EXPERIMENTAL
  * BLEEDINGEDGE
  * MAYCAUSEYOURSYSTEMTOEXPLODE

that sort of thing. the beauty of this scheme is that it allows you to
subjectively define how safe, dangerous or dead any variable is, and
at the top of the config process, if you want, you should be able to
select which maturity levels you want to be presented with, just like
you can select whether or not to see EXPERIMENTAL or not.

  in a single choice list menu, you might decide that you want to be
presented with only maturity levels NORMAL, DEPRECATED and
EXPERIMENTAL, but not OBSOLETE or BLEEDINGEDGE, that sort of thing.
it's nothing more than the idea of EXPERIMENTAL, cleaned up and
generalized. this allows folks to decide, with a few keystrokes, how
safe or how dangerous they want their configuration to be.

  one final benefit -- it should be easy to list the (non-default)
maturity level of every variable next to it during the config process
so you can *see* its maturity during configuration, rather than
needing the ugly hack of setting something as EXPERIMENTAL and *also*
having to add the string "(EXPERIMENTAL)" so people realize it. yuck.

  all of this could be added to Kbuild as a first step without even
changing any of the Kconfig files and, little by little, developers
could start taking advantage of it, so it's not like there would be
any huge transition at any point -- the ability to use the feature
would just appear, and you could use it or ignore it.

  thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================
