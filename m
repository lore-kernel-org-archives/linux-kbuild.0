Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54340 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753046Ab1HJJwf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 10 Aug 2011 05:52:35 -0400
Message-ID: <4E4254E1.5070909@suse.cz>
Date: Wed, 10 Aug 2011 11:52:33 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic
 reorg
References: <20110807204118.GA2203@ZenIV.linux.org.uk> <CA+55aFxSOio5efktO+fQOL6qEaE2KBFyCcOcvNMOvWGpY-ktiQ@mail.gmail.com>
In-Reply-To: <CA+55aFxSOio5efktO+fQOL6qEaE2KBFyCcOcvNMOvWGpY-ktiQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>

On 7.8.2011 23:00, Linus Torvalds wrote:
> However, having it for the default case for those full header files is
> just annoying - as you say, those idiotic one-liner <asm/bar.h> files
> that just include the asm-generic one are annoying, and quite frankly,
> the current work-around for them (that "generic-y" thing) is not
> really any better. It's just another way to do the same broken thing.

It replaces oneline files with a multiline list in a single file, so it
makes no difference linewise, but at least one arch has it all in a
single place.


> So I would suggest we just start a new directory, something like
> include/default, and add it as the last entry to the search path. Then
> we start populating it with <asm/xyz.h> files, and start removing the
> silly 'generic-y' workaround. Let's just use the search-path instead.

But we would still have to generate the wrapper for userspace headers,
we can't rely on any -I/usr/include/default in userspace. So
Makefile.headersinst would still need some special handling for these
headers.

Michal
