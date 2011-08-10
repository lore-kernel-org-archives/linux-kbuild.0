Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:64474 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753947Ab1HJMUr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Aug 2011 08:20:47 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic reorg
Date: Wed, 10 Aug 2011 14:20:03 +0200
References: <20110807204118.GA2203@ZenIV.linux.org.uk> <CA+55aFxSOio5efktO+fQOL6qEaE2KBFyCcOcvNMOvWGpY-ktiQ@mail.gmail.com> <4E4254E1.5070909@suse.cz>
In-Reply-To: <4E4254E1.5070909@suse.cz>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201108101420.03789.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, David Howells <dhowells@redhat.com>

On Wednesday 10 August 2011, Michal Marek wrote:
> On 7.8.2011 23:00, Linus Torvalds wrote:
> > There is value in having <asm-generic/xyz.h> for helper headers that
> > are not complete in themselves. And for that case, we really do want
> > to have the ability for header files to just do
> > 
> >  #include <asm-generic/bitops/le.h>

There are very few of these files, and there is no reason for them to
be named asm/* or arm-generic/*. How about moving those incomplete
files into a different directory to separate the problem space?

We can e.g. move asm-generic/bitops/ to linux/bitops/

> > So I would suggest we just start a new directory, something like
> > include/default, and add it as the last entry to the search path. Then
> > we start populating it with <asm/xyz.h> files, and start removing the
> > silly 'generic-y' workaround. Let's just use the search-path instead.
> 
> But we would still have to generate the wrapper for userspace headers,
> we can't rely on any -I/usr/include/default in userspace. So
> Makefile.headersinst would still need some special handling for these
> headers.

Right. We have to deal with at least three cases here:

1. An architecture does not provide its own asm/foo.h, and we want the
   generic version to transparently be used.
2. Another architecture has an asm/foo.h that contains a few arch specific
   definitions plus an include of the generic file.
3. There is a generic file that is used as a helper from a file with a
   different name (e.g. bitops/find.h, libata-portmap.h, atomic-long.h, ...).

Simply renaming "asm-generic" to "asm" or "default/asm" with an appropriate
include path would take care of the first kind, but not of the second.
This is also easy to handle for headers exported to user space, where we
can simply copy the generic header instead of an arch specific one when
that does not exist.

The second case is still easily handled in many cases, except for the 34
generic header files that do get exported to user space (see
include/asm-generic/Kbuild). The best I can think of is to move them to
linux/include/asm-generic/asm/ and install them to
/usr/include/asm-generic/asm/ to avoid opening up another namespace
for user space headers. Any file including them would then have to be
changed to "#include <asm-generic/asm/foo.h>".

I hope that the work that David Howells is trying to push for the
separation between internal and ABI headers will help a bit to
simplify this.

	Arnd
