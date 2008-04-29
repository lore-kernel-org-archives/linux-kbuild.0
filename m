Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:57501 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754361AbYD2Se5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Apr 2008 14:34:57 -0400
Date: Tue, 29 Apr 2008 20:35:31 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Additional kconfig targets (cloneconfig, nonint_oldconfig etc)
Message-ID: <20080429183531.GB19652@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, Roland McGrath <roland@redhat.com>, Andres Salomon <dilinger@queued.net>

Recently there has been request for a number of new
kconfig related targets.

In general it boils down to the following:

We need to be flexible in what configuration
we start out from and how we apply it.

We need to be able to apply it in following ways:
1) automated - select defaults for all new symbols
   => It is used for "make defconfig, make *_defconfig" today

2) interactive - asking user for all new symbols
   and error out if stdin is redirected

3) list unknown - list all new symbols and do not
   create a new config

With oldconfig today we have two modes:
-> One mode where we are very chatty and show
   all output.
-> And the 'silent' mode where we only start being
   chatty when we see a new symbol.

I plan to drop the 'very chatty' mode as I
do not see it usefull.
So in essense 'make oldconfig' and 'make silentoldconfig'
become equal.

The commands we have today for kconfig is:

# Command line variants
make oldconfig
make silentoldconfig
make defconfig
make XXX_defconfig

(The other frontends are left out on purpose).
The challenge here is to come up with a syntax that
allows us to select between the three behaviours,
while keeping backward compatibility.

The best suggestion I have so far is to say that:
a) if defconfig is specified then we use method 1)
b) if oldconfig is specified then we use method 2)
c) if newconfig is specified then we use method 3)

And we add support for a new 'commandline' parameter
'K' so I can say:

make K=/proc/config.gz defconfig
make K=i386_defconfig  defconfig
make K=i386_defconfig  oldconfig
make K=/proc/config.gz newconfig

So K is used to specify what config file we use
to start out from.

Care should be taken to keep the known good
targets working as before.

Andres Salomon already did some preparational work
for this but I need to find a good way to handle the K=
parameter.
Dave J also posted patches that is useful for 'newconfig'.

But I wanted to ask for opinions before diving into
implmenting this.

	Sam

[Random notes..]

# Enviroment variables affecting kconfig
KCONFIG_ALLCONFIG
KCONFIG_NOSILENTUPDATE
KCONFIG_CONFIG
KCONFIG_OVERWRITECONFIG
KCONFIG_NOTIMESTAMP
KCONFIG_AUTOCONFIG
KCONFIG_AUTOHEADER

#input files (aparts from the mandatory ones)
all.config
allno.config
allmod.config
allyes.config
allrandom.config

