Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jessica.hrz.tu-chemnitz.de ([134.109.132.47]:56658 "EHLO
	jessica.hrz.tu-chemnitz.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754360Ab0IJPOT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Sep 2010 11:14:19 -0400
From: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
Subject: Re: xconfig build error in linux-next??
Date: Fri, 10 Sep 2010 17:14:16 +0200
References: <20100909162122.094a1e71.rdunlap@xenotime.net> <20100909165958.c5cb462f.rdunlap@xenotime.net> <4C8A42B0.5020500@suse.cz>
In-Reply-To: <4C8A42B0.5020500@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201009101714.16973.alexander.stein@informatik.tu-chemnitz.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hello Randy,

On Friday 10 September 2010 16:37:36 Michal Marek wrote:
> >>   GEN     /lnx/src/TMP/linux-next-20100902/xx64/Makefile
> >> 
> >> mkdir -p include/linux include/config
> >> make -f /lnx/src/TMP/linux-next-20100902/scripts/Makefile.build
> >> obj=scripts/kconfig xconfig **Unknown**/moc -i
> >> /lnx/src/TMP/linux-next-20100902/scripts/kconfig/qconf.h -o
> >> scripts/kconfig/qconf.moc /bin/sh: **Unknown**/moc: No such file or
> >> directory
> >> make[2]: *** [scripts/kconfig/qconf.moc] Error 127
> >> make[1]: *** [xconfig] Error 2
> >> make: *** [sub-make] Error 2
> >> 
> >> 
> >> Any ideas what happened?

It seems QT4 isn't detected properly. Could you please check the output of
> qmake -query QT_INSTALL_BINS
> qmake -query QT_INSTALL_LIBS
> qmake -query QT_INSTALL_HEADERS

I also have several other questions:
* Which distribution are you running?
* Where is qmake and moc installed on your system?

Best regards,
Alexander
