Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0239.hostedemail.com ([216.40.44.239]:39010 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754123AbcJWTXW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Oct 2016 15:23:22 -0400
Message-ID: <1477250598.3561.4.camel@perches.com>
Subject: Re: [RFC PATCH] kbuild: add -fno-PIE
From: Joe Perches <joe@perches.com>
Date: Sun, 23 Oct 2016 12:23:18 -0700
In-Reply-To: <87eg37niky.fsf@turtle.gmx.de>
References: <20161021111600.9417-1-bigeasy@linutronix.de>
         <20161021212127.GA32611@angband.pl> <87eg37niky.fsf@turtle.gmx.de>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>, Adam Borowski <kilobyte@angband.pl>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, ben@decadent.org.uk

On Sun, 2016-10-23 at 18:19 +0200, Sven Joachim wrote:
> On 2016-10-21 23:21 +0200, Adam Borowski wrote:
> > On Fri, Oct 21, 2016 at 01:16:00PM +0200, Sebastian Andrzej Siewior wrote:
> > > Debian started to build the gcc with --enable-default-pie by default
[]
> > > diff --git a/Makefile b/Makefile
[]
> > > @@ -398,7 +398,7 @@ KBUILD_CPPFLAGS := -D__KERNEL__
> > >  KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
> > >  		   -fno-strict-aliasing -fno-common \
> > >  		   -Werror-implicit-function-declaration \
> > > -		   -Wno-format-security \
> > > +		   -Wno-format-security -fno-PIE \
> > >  		   -std=gnu89

I've used this here instead:

KBUILD_CFLAGS  += $(call cc-option,-fno-pie)

