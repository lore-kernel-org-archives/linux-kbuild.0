Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:18724 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750741Ab1HKOZJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Aug 2011 10:25:09 -0400
Date: Thu, 11 Aug 2011 16:25:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic
	reorg
Message-ID: <20110811142507.GA22394@merkur.ravnborg.org>
References: <20110807204118.GA2203@ZenIV.linux.org.uk> <4E4254E1.5070909@suse.cz> <CA+55aFy9_menekFnwEPFVYb493m-_77HibPL4VXfd6-Jh4rzLA@mail.gmail.com> <201108111516.44243.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201108111516.44243.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>

On Thu, Aug 11, 2011 at 03:16:43PM +0200, Arnd Bergmann wrote:
> On Wednesday 10 August 2011, Linus Torvalds wrote:
> > Or you can do it by creating the default file, and then editing EVERY
> > SINGLE ARCHITECTURE. Which just sucks.
> > 
> > This has come up before, for similar situations - wanting to implement
> > optional architecture capabilities without having to worry about
> > architectures that don't support it.
> 
> If you mostly care about new extensions, we can ignore all the
> user ABI headers for now and find a solution that just deals with
> the kernel internal ones.
> 
> I think the easiest way to do that would be to move all non-exported
> headers from include/asm-generic to include/asm. Since it's only about
> internel users then, we can simply use "#include_next <asm/foo.h>"
> to refer to them from arch-specific files that want to reuse them
> only partially and also add some of their own definitions.

We could also create:

    arch/$ARCH/include/arch/
    include/default/arch

"-I include/default" should then be added last in the search path.

An arch generic file could be dropepd in include/default/arch
and be available for everyone.
And an arch specific file could then include the arch generic
file using: 

    #include <default/arch/foo.h>

This is only a slight variant of what has already been suggested,
but it avoids include_next - in favour of an additional
directory that is searched.

	Sam
