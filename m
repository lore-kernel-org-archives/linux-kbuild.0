Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([72.52.115.56]:36886 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1753340Ab0IJPUY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Sep 2010 11:20:24 -0400
Received: from chimera.site ([173.50.240.230]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Fri, 10 Sep 2010 08:20:15 -0700
Date: Fri, 10 Sep 2010 08:20:14 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: xconfig build error in linux-next??
Message-Id: <20100910082014.790a3074.rdunlap@xenotime.net>
In-Reply-To: <201009101714.16973.alexander.stein@informatik.tu-chemnitz.de>
References: <20100909162122.094a1e71.rdunlap@xenotime.net>
	<20100909165958.c5cb462f.rdunlap@xenotime.net>
	<4C8A42B0.5020500@suse.cz>
	<201009101714.16973.alexander.stein@informatik.tu-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Stein <alexander.stein@informatik.tu-chemnitz.de>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Fri, 10 Sep 2010 17:14:16 +0200 Alexander Stein wrote:

> Hello Randy,
> 
> On Friday 10 September 2010 16:37:36 Michal Marek wrote:
> > >>   GEN     /lnx/src/TMP/linux-next-20100902/xx64/Makefile
> > >> 
> > >> mkdir -p include/linux include/config
> > >> make -f /lnx/src/TMP/linux-next-20100902/scripts/Makefile.build
> > >> obj=scripts/kconfig xconfig **Unknown**/moc -i
> > >> /lnx/src/TMP/linux-next-20100902/scripts/kconfig/qconf.h -o
> > >> scripts/kconfig/qconf.moc /bin/sh: **Unknown**/moc: No such file or
> > >> directory
> > >> make[2]: *** [scripts/kconfig/qconf.moc] Error 127
> > >> make[1]: *** [xconfig] Error 2
> > >> make: *** [sub-make] Error 2
> > >> 
> > >> 
> > >> Any ideas what happened?
> 
> It seems QT4 isn't detected properly. Could you please check the output of
> > qmake -query QT_INSTALL_BINS

**Unknown**

> > qmake -query QT_INSTALL_LIBS

**Unknown**

> > qmake -query QT_INSTALL_HEADERS

**Unknown**


> I also have several other questions:
> * Which distribution are you running?

fedora 11

> * Where is qmake and moc installed on your system?

/usr/lib64/qt-3.3/bin/qmake
/usr/lib64/qt-3.3/bin/moc


Thanks.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
