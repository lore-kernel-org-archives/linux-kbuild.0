Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:33838 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfLRRX7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 12:23:59 -0500
Date: Wed, 18 Dec 2019 18:23:53 +0100
From: Johan Hovold <johan@kernel.org>
Subject: kbuild obj-m directory descend (was: Re: [PATCH] serdev: fix builds
 with CONFIG_SERIAL_DEV_BUS=m)
Message-ID: <20191218172353.GO22665@localhost>
References: <201912181000.82Z7czbN%lkp@intel.com>
 <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191218083842.14882-1-u.kleine-koenig@pengutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, kernel@pengutronix.de, kbuild test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org

On Wed, Dec 18, 2019 at 09:38:42AM +0100, Uwe Kleine-König wrote:
> Commit 54edb425346a ("serdev: simplify Makefile") broke builds with
> serdev configured as module. I don't understand it completely yet, but
> it seems that
> 
> 	obj-$(CONFIG_SERIAL_DEV_BUS) += serdev/
> 
> in drivers/tty/Makefile with CONFIG_SERIAL_DEV_BUS=m doesn't result in
> code that is added using obj-y in drivers/tty/serdev/Makefile being
> compiled. So instead of dropping $(CONFIG_SERIAL_DEV_BUS) in serdev's
> Makefile, drop it in drivers/tty/Makefile.

I was just looking into this when you commented on this off-list.

The offending patch is broken since it effectively makes
CONFIG_SERIAL_DEV_BUS bool (built-in or disabled), but for some reason
those symbols do not end up in vmlinux (despite being compiled) when you
add a built-in object goal under a directory that was entered using
obj-m.

That seems like a bug to me and contradicts the kbuild documentation
(3.6):

	Example:

	#fs/Makefile
	obj-$(CONFIG_EXT2_FS) += ext2/

	If CONFIG_EXT2_FS is set to either ‘y’ (built-in) or ‘m’
	(modular) the corresponding obj- variable will be set, and
	kbuild will descend down in the ext2 directory. Kbuild only uses
	this information to decide that it needs to visit the directory,
	it is the Makefile in the subdirectory that specifies what is
	modular and what is built-in.

I tried adding other targets to obj-y directly and they are also are not
included, seemingly since the directory was entered using obj-m.

Masahiro or Michal, can you shed some light?

Johan
