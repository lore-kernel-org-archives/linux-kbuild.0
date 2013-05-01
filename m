Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:34465 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755623Ab3EAT6y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 1 May 2013 15:58:54 -0400
Received: by mail-pb0-f54.google.com with SMTP id jt11so877992pbb.27
        for <linux-kbuild@vger.kernel.org>; Wed, 01 May 2013 12:58:53 -0700 (PDT)
Date: Wed, 1 May 2013 12:58:51 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
Subject: Re: linux-next: Tree for May 1 (media/usb/stk1160)
In-Reply-To: <20130501192845.GA18811@free.fr>
Message-ID: <alpine.DEB.2.02.1305011258180.8448@chino.kir.corp.google.com>
References: <20130501183734.7ad1efca2d06e75432edabbd@canb.auug.org.au> <518157EB.3010700@infradead.org> <20130501192845.GA18811@free.fr>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media <linux-media@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Wed, 1 May 2013, Yann E. MORIN wrote:

> > When CONFIG_SND=m and CONFIG_SND_AC97_CODEC=m and
> > CONFIG_VIDEO_STK1160=y
> > CONFIG_VIDEO_STK1160_AC97=y
> > 
> > drivers/built-in.o: In function `stk1160_ac97_register':
> > (.text+0x122706): undefined reference to `snd_card_create'
> > drivers/built-in.o: In function `stk1160_ac97_register':
> > (.text+0x1227b2): undefined reference to `snd_ac97_bus'
> > drivers/built-in.o: In function `stk1160_ac97_register':
> > (.text+0x1227cd): undefined reference to `snd_card_free'
> > drivers/built-in.o: In function `stk1160_ac97_register':
> > (.text+0x12281b): undefined reference to `snd_ac97_mixer'
> > drivers/built-in.o: In function `stk1160_ac97_register':
> > (.text+0x122832): undefined reference to `snd_card_register'
> > drivers/built-in.o: In function `stk1160_ac97_unregister':
> > (.text+0x12285e): undefined reference to `snd_card_free'
> > 
> > 
> > This kconfig fragment:
> > config VIDEO_STK1160_AC97
> > 	bool "STK1160 AC97 codec support"
> > 	depends on VIDEO_STK1160 && SND

This doesn't depend on SND, it depends on SND=y.
