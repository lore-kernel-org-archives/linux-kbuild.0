Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from xenotime.net ([66.160.160.81]:42195 "HELO xenotime.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1764401AbYBLUlj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Feb 2008 15:41:39 -0500
Received: from midway.site ([71.245.99.126]) by xenotime.net for <linux-kbuild@vger.kernel.org>; Tue, 12 Feb 2008 12:41:33 -0800
Date: Tue, 12 Feb 2008 12:41:33 -0800
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: Fwd: Re: build #350 issue for v2.6.25-rc1 in
 drivers/i2c/busses/i2c-i801.c
Message-Id: <20080212124133.8237c531.rdunlap@xenotime.net>
In-Reply-To: <200802121157.14502.toralf.foerster@gmx.de>
References: <200802121157.14502.toralf.foerster@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
Cc: linux-kbuild@vger.kernel.org

On Tue, 12 Feb 2008 11:57:14 +0100 Toralf Förster wrote:

> Hello,
> 
> does the mentioned  issue (pls see below) belong to kbuild ?

(plz see below)

> 
> ----------  Weitergeleitete Nachricht  ----------
> Subject: Re: build #350 issue for v2.6.25-rc1 in drivers/i2c/busses/i2c-i801.c
> Date: Dienstag, 12. Februar 2008
> From: Jean Delvare <khali@linux-fr.org>
> To: Toralf Förster <toralf.foerster@gmx.de>
> 
> Hi Toralf,
> 
> On Tue, 12 Feb 2008 09:38:35 +0100, Toralf Förster wrote:
> > the build with the attached .config failed, make ends with:
> > ...
> >   LD      drivers/i2c/busses/built-in.o
> >   CC [M]  drivers/i2c/busses/i2c-i801.o
> > drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
> > drivers/i2c/busses/i2c-i801.c:636: error: implicit declaration of function 'pci_request_region'
> > drivers/i2c/busses/i2c-i801.c:676: error: implicit declaration of function 'pci_release_region'
> > make[3]: *** [drivers/i2c/busses/i2c-i801.o] Error 1
> > make[2]: *** [drivers/i2c/busses] Error 2
> > make[1]: *** [drivers/i2c] Error 2
> > make: *** [drivers] Error 2
> > 
> > The build was made with :
> > $> make mrproper && make rndconfig && <tweak config file> && make oldconfig && make
> > 
> > Here's the config:
> > 
> > #
> > # Automatically generated make config: don't edit
> 
> Note, it says: don't edit.
> 
> > # Linux kernel version: 2.6.25-rc1
> > # Mon Feb 11 17:42:48 2008
> > #
> > (...)
> > # CONFIG_PCI is not set
> > (...)
> > # CONFIG_I2C is not set
> > CONFIG_I2C_I801=m
> 
> You set CONFIG_I2C_I801=m while PCI and I2C are both disabled. You
> asked for a built breakage, you got it.

randconfig set I2C_I801=m and kconfig does not know how to follow
dependencies of 'select', so I'd say Yes, this is a kconfig problem.

Yes, I see this one often.  I wish someone were willing to try
to fix it.  I've looked at the source code, but I'm not willing to
dive deeply into it.

> You might argue that "make oldconfig" should fix the configuration file
> in such a way that the dependencies are correct again. But then this is
> a kconfig issue, to be reported to the kconfig maintainer, not me.

---
~Randy
