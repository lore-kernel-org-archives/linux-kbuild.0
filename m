Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtpoutwbe02.prod.mesa1.secureserver.net ([208.109.78.113]:57888
	"HELO smtpoutwbe02.prod.mesa1.secureserver.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751082AbZLRBFA convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Dec 2009 20:05:00 -0500
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="utf-8"
Message-Id: <20091217180458.0b50c25debf12a9aa545bf810459b532.82da3172b8.wbe@email.secureserver.net>
From: "Jiafu He" <jay@goldhive.com>
Subject: RE: [PATCH] Makefile.build: Fix built-in.o linking errors
Date: Thu, 17 Dec 2009 18:04:58 -0700
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

Michal wrote:
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -82,7 +82,7 @@ ifneq ($(strip $(lib-y) $(lib-m) $(lib-n) $(lib-)),)
> >  lib-target := $(obj)/lib.a
> >  endif
> >  
> > -ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(lib-target)),)
> > +ifneq ($(strip $(obj-y) $(obj-m) $(obj-n) $(obj-) $(subdir-m)
> > $(lib-target)),)
> >  builtin-target := $(obj)/built-in.o
> >  endif
> 
> Ack on this part, I need to think a bit more about the second part :).
> Could you please send two separate patches, they fix two independent
> issues after all.
> 
Sure. I'll resend the patches in two.

Thanks.

Jiafu


