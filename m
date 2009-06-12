Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.188]:58732 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932696AbZFLJvP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 12 Jun 2009 05:51:15 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: PATCH: README - Fix misleading pointer to the defconf directory
Date: Fri, 12 Jun 2009 11:50:39 +0200
References: <4A321A3C.6030400@gmx.de>
In-Reply-To: <4A321A3C.6030400@gmx.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200906121150.40332.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Patrick Ringl <patrick.ringl@gmx.de>
Cc: linux-kernel@vger.kernel.org, torvalds@osdl.org, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>

On Friday 12 June 2009, Patrick Ringl wrote:
> the README simply points to a wrong/non-existent directory where the default
> configurations are not suited, hence the patch.

On six architectures, it's still the right directory, your patch breaks it.

> Signed-off-by: Patrick Ringl <patrick_@freenet.de>
>
> --- linux.orig/README   2009-06-10 05:05:27.000000000 +0200
> +++ linux/README        2009-06-12 10:46:15.000000000 +0200
> @@ -175,7 +175,7 @@
>                            Like above, but avoids cluttering the screen
>                            with questions already answered.
>         "make defconfig"   Create a ./.config file by using the default
> -                          symbol values from arch/$ARCH/defconfig.
> +                          symbol values from arch/$ARCH/configs/*_defconfig.
>         "make allyesconfig"
>                            Create a ./.config file by setting symbol
>                            values to 'y' as much as possible.

You could write e.g.

	default symbol values from one of arch/{$ARCH}/defconfig or
	arch/${ARCH}/configs/${PLATFORM}_defconfig, depending on
	the architecture.

It would also be consistent to list the specific defconfigs here, like

	"make ${PLATFORM}_defconfig"
			Create a ./.config file by using the default
			symbol values from
			arch/${ARCH}/configs/${PLATFORM}_defconfig.
			Use "make help" to see a list of the available
			platforms on your architecture.

Not also that your patch should be merged through a subsystem maintainer.
If you don't know who that is, use scripts/get_maintainer.pl.
For scripts/kconfig/* and README it suggests sending it to Sam, Roman and
linux-kbuild@vger.kernel.org, which sounds right.

	Arnd <><
