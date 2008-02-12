Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.gmx.net ([213.165.64.20]:55922 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1752325AbYBLK5T convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Feb 2008 05:57:19 -0500
From: Toralf =?iso-8859-15?q?F=F6rster?= <toralf.foerster@gmx.de>
Subject: Fwd: Re: build #350 issue for v2.6.25-rc1 in drivers/i2c/busses/i2c-i801.c
Date: Tue, 12 Feb 2008 11:57:14 +0100
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200802121157.14502.toralf.foerster@gmx.de>
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hello,

does the mentioned  issue (pls see below) belong to kbuild ?


----------  Weitergeleitete Nachricht  ----------
Subject: Re: build #350 issue for v2.6.25-rc1 in drivers/i2c/busses/i2c-i801.c
Date: Dienstag, 12. Februar 2008
From: Jean Delvare <khali@linux-fr.org>
To: Toralf Förster <toralf.foerster@gmx.de>

Hi Toralf,

On Tue, 12 Feb 2008 09:38:35 +0100, Toralf Förster wrote:
> the build with the attached .config failed, make ends with:
> ...
>   LD      drivers/i2c/busses/built-in.o
>   CC [M]  drivers/i2c/busses/i2c-i801.o
> drivers/i2c/busses/i2c-i801.c: In function 'i801_probe':
> drivers/i2c/busses/i2c-i801.c:636: error: implicit declaration of function 'pci_request_region'
> drivers/i2c/busses/i2c-i801.c:676: error: implicit declaration of function 'pci_release_region'
> make[3]: *** [drivers/i2c/busses/i2c-i801.o] Error 1
> make[2]: *** [drivers/i2c/busses] Error 2
> make[1]: *** [drivers/i2c] Error 2
> make: *** [drivers] Error 2
> 
> The build was made with :
> $> make mrproper && make rndconfig && <tweak config file> && make oldconfig && make
> 
> Here's the config:
> 
> #
> # Automatically generated make config: don't edit

Note, it says: don't edit.

> # Linux kernel version: 2.6.25-rc1
> # Mon Feb 11 17:42:48 2008
> #
> (...)
> # CONFIG_PCI is not set
> (...)
> # CONFIG_I2C is not set
> CONFIG_I2C_I801=m

You set CONFIG_I2C_I801=m while PCI and I2C are both disabled. You
asked for a built breakage, you got it.

You might argue that "make oldconfig" should fix the configuration file
in such a way that the dependencies are correct again. But then this is
a kconfig issue, to be reported to the kconfig maintainer, not me.

-- 
Jean Delvare

-------------------------------------------------------

-- 
MfG/Sincerely

Toralf Förster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3
