Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:56440 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752414Ab3H2GDh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Aug 2013 02:03:37 -0400
Date: Thu, 29 Aug 2013 08:03:36 +0200
From: Andi Kleen <andi@firstfloor.org>
Subject: Re: 32bit allyesconfig on 64bit system broke
Message-ID: <20130829060336.GL19750@two.firstfloor.org>
References: <20130809225736.GG19750@two.firstfloor.org>
 <520A97C1.6000708@suse.cz>
 <521E661B.1030802@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521E661B.1030802@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Michal Marek <mmarek@suse.cz>, Andi Kleen <andi@firstfloor.org>, linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2013 at 02:05:31PM -0700, H. Peter Anvin wrote:
> On 08/13/2013 01:32 PM, Michal Marek wrote:
> > Dne 10.8.2013 00:57, Andi Kleen napsal(a):
> >>
> >> % linux32 make allyesconfig
> >> % head .config
> >> % head .config
> >> #
> >> # Automatically generated file; DO NOT EDIT.
> >> # Linux/x86 3.11.0-rc4 Kernel Configuration
> >> #
> >> CONFIG_64BIT=y
> >> CONFIG_X86_64=y
> >> CONFIG_X86=y
> >>
> >> This used to work to give me a 32bit allyesconfig.
> >> How am I supposed to do this now?
> > 
> > This changed in ffee0de (x86: Default to ARCH=x86 to avoid overriding
> > CONFIG_64BIT). The default $ARCH value on both ix86 and x86_64
> > buildhosts is "x86" and CONFIG_64BIT is therefore a user-selectable
> > knob. You can do
> > 
> >   make ARCH=i386 allyesconfig
> > 
> > to force 32bit. Or the generic way:
> > 
> >   echo '# CONFIG_64BIT is not set' >base.config
> >   KCONFIG_ALLCONFIG=base.config linux32 make allyesconfig
> > 
> 
> "make ARCH=i386 allyesconfig" has been the standard way to do this for
> quite a few years, so that is the forward and backwards compatible way.

I've always used "linux32 ..."

Well it broke all my scripts and seems to be a totally pointless
change as far as I can tell.

The worse thing is that I didn't notice initially because it's
a silent problem -- the 64bit kernel still boots fine on any
system with lm support, even with 32bit userland.

So silently breaking long established practice ... no excuse for things
like that really in a project like Linux. If you break things
please always do it in a obvious way.

-Andi
