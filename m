Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zeniv.linux.org.uk ([195.92.253.2]:57816 "EHLO
	ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750884Ab1HKNZr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Aug 2011 09:25:47 -0400
Date: Thu, 11 Aug 2011 14:25:16 +0100
From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic
 reorg
Message-ID: <20110811132516.GQ2203@ZenIV.linux.org.uk>
References: <20110807204118.GA2203@ZenIV.linux.org.uk>
 <4E4254E1.5070909@suse.cz>
 <CA+55aFy9_menekFnwEPFVYb493m-_77HibPL4VXfd6-Jh4rzLA@mail.gmail.com>
 <201108111516.44243.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201108111516.44243.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, David Howells <dhowells@redhat.com>

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

Aiiieee...  Please, please, no - include_next is a very ugly idea ;-/
Let's avoid it, if at all possible.
