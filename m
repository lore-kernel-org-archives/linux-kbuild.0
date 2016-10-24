Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0250.hostedemail.com ([216.40.44.250]:39722 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S934500AbcJXJ5f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2016 05:57:35 -0400
Message-ID: <1477303025.1983.2.camel@perches.com>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
From: Joe Perches <joe@perches.com>
In-Reply-To: <8760oinqly.fsf@turtle.gmx.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
         <20161021212127.GA32611@angband.pl> <87eg37niky.fsf@turtle.gmx.de>
         <1477250598.3561.4.camel@perches.com> <8760oinqly.fsf@turtle.gmx.de>
Content-Type: text/plain; charset="ISO-8859-1"
Date: Mon, 24 Oct 2016 02:57:05 -0700
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>
Cc: Adam Borowski <kilobyte@angband.pl>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On Mon, 2016-10-24 at 09:38 +0200, Sven Joachim wrote:
> On 2016-10-23 12:23 -0700, Joe Perches wrote:
> 
> > On Sun, 2016-10-23 at 18:19 +0200, Sven Joachim wrote:
> > > On 2016-10-21 23:21 +0200, Adam Borowski wrote:
> > > > On Fri, Oct 21, 2016 at 01:16:00PM +0200, Sebastian Andrzej Siewior wrote:
> > > > > Debian started to build the gcc with --enable-default-pie by default
> > 
> > []
> > > > > diff --git a/Makefile b/Makefile
> > 
> > []
> > > > > @@ -398,7 +398,7 @@ KBUILD_CPPFLAGS := -D__KERNEL__
> > > > >  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> > > > >  		   -fno-strict-aliasing -fno-common \
> > > > >  		   -Werror-implicit-function-declaration \
> > > > > -		   -Wno-format-security \
> > > > > +		   -Wno-format-security -fno-PIE \
> > > > >  		   -std=gnu89
> > 
> > I've used this here instead:
> > 
> > KBUILD_CFLAGS  += $(call cc-option,-fno-pie)
> 
> Where exactly do you set that?  I tried this patch:
> 
> --8<---------------cut here---------------start------------->8---
> diff --git a/Makefile b/Makefile
> index 93beca4..fde1e21 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -619,6 +619,7 @@ ARCH_AFLAGS :=
>  ARCH_CFLAGS :=
>  include arch/$(SRCARCH)/Makefile
>  
> +KBUILD_CFLAGS	+= $(call cc-option,-fno-pie,)
>  KBUILD_CFLAGS	+= $(call cc-option,-fno-delete-null-pointer-checks,)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning,maybe-uninitialized,)
>  KBUILD_CFLAGS	+= $(call cc-disable-warning,frame-address,)
> --8<---------------cut here---------------end--------------->8---
> 
> But make still fails with it. :-(

---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 512e47a53e9a..e2a0d46820e4 100644
--- a/Makefile
+++ b/Makefile
@@ -400,6 +400,7 @@ KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -Werror-implicit-function-declaration \
 		   -Wno-format-security \
 		   -std=gnu89
+KBUILD_CFLAGS	+= $(call cc-option,-fno-pie)
 
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=


