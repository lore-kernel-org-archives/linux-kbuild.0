Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:35298 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753652AbZCOKVp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Mar 2009 06:21:45 -0400
Date: Sun, 15 Mar 2009 11:23:41 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: kconfig - fix randconfig
Message-ID: <20090315102341.GA6051@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, Ingo Molnar <mingo@elte.hu>

kconfig failed to generate random values for choice values in
a choice block thus limiting the effect of builds based on randconfig
generated configs.

To test this I used this small config:

config MOD
	def_bool n
	option modules

choice CHOICE
        prompt "ABCD Choice"
        default A

config A
        tristate "A"

config B
        tristate "B"

config C
        tristate "C"

config D
        tristate "D"

endchoice

With the fix applied we now distribute the values more or
less even among the choice symbols.
And if MOD is enabled then we have several entries enabled.

Furhtermore calling randconfig several times in row made it
generate the same config as it used a second based seed.

Two patches follows - they are also at kfixes.git

	Sam
