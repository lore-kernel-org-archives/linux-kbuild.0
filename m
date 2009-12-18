Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpoutwbe02.prod.mesa1.secureserver.net ([208.109.78.113]:54960
	"HELO smtpoutwbe02.prod.mesa1.secureserver.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752549AbZLRAz5 convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 19:55:57 -0500
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Message-Id: <20091217175555.0b50c25debf12a9aa545bf810459b532.792a483b4a.wbe@email.secureserver.net>
From: "Jiafu He" <jay@goldhive.com>
Subject: RE: [PATCH] Kconfig: default m doesn't work for menuconfig/xconfig/gconfig
 even if =?UTF-8?Q?CONFIG=5FMODULES=3Dy?=
Date: Thu, 17 Dec 2009 17:55:55 -0700
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>



> -------- Original Message --------
> Subject: Re: [PATCH] Kconfig: default m doesn't work for
> menuconfig/xconfig/gconfig even if CONFIG_MODULES=y
> From: Michal Marek <mmarek@suse.cz>
> Date: Thu, December 17, 2009 4:48 pm
> To: Jiafu He <jay@goldhive.com>
> Cc: linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>
> 
> 
> Jiafu He napsal(a):
> > menuconfig/xconfig/gconfig all fails to set tristate CONFIG_ options to
> > m even if CONFIG_MODULES=y has been set. The "config" target works,
> > though.
> 
> On a x86_64, I tried adding
> config FOOBAR
>         tristate "foobar"
>         default m
>         ---help---
>            aaa aaa
> to init/Kconfig
> 
> The I run make menuconfig in an already configured build dir and in an
> empty one, in both cases FOOBAR was preset to M. Could you provide a
> step-by-step testcase that shows the problem you want to fix?
> 
It must be the host or source tree defconfig's jumped in. Remember to
delete .config and commenting out the "default" lines for "config
DEFCONFIG_LIST" in init/Kconfig and the "default" lines for "config
ARCH_DEFCONFIG" in arch/x86/Kconfig before running 'make menuconfig'. In
my case (Centos 5), the "/boot/config-$UNAME_RELEASE", which contains
'CONFIG_MODULES=y', jumps in the way.

Jiafu


