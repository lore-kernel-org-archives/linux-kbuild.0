Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:46731 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752789AbaJBNSO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Oct 2014 09:18:14 -0400
Date: Thu, 02 Oct 2014 22:17:54 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: Re: [PATCH 3/3] kbuild: remove obj-n and lib-n handling
In-Reply-To: <542D4D6C.9000505@suse.cz>
References: <1410258381-7088-4-git-send-email-yamada.m@jp.panasonic.com> <542D4D6C.9000505@suse.cz>
Message-Id: <20141002221754.3504.AA925319@jp.panasonic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org

Hi Michal,


On Thu, 02 Oct 2014 15:04:44 +0200
Michal Marek <mmarek@suse.cz> wrote:

> On 2014-09-09 12:26, Masahiro Yamada wrote:
> > Kconfig never defines CONFIG_* as 'n'.
> > Now obj-n is only used in firmware/Makefile and it can be
> > replaced with obj-.  No makefile uses lib-n.
> 
> BTW, there are a few more instances of *-n, none of which seem useful:
> 
> $ git --no-pager grep -e '[a-z]-n\>'  -- '*Makefile*' '*Kbuild*'
> Makefile:		     $(init-n) $(init-) \
> Makefile:		     $(core-n) $(core-) $(drivers-n) $(drivers-) \
> Makefile:		     $(net-n)  $(net-)  $(libs-n)    $(libs-))))
> arch/arm/mach-ixp4xx/Makefile:obj-pci-n	:=
> arch/powerpc/boot/Makefile:initrd-  := $(patsubst zImage%,
> zImage.initrd%, $(image-n) $(image-))

Uh, I missed them.

Anyway, it should be done in a separate patch
even if we fix them.

Can you fix them, please?
(I do not want to steal what you found.)

Simpler makefiles seem better.



Best Regards
Masahiro Yamada

