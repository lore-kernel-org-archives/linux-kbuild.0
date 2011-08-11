Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:59201 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755847Ab1HKNQv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Aug 2011 09:16:51 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] possible killing of boilerplate headers by asm-generic reorg
Date: Thu, 11 Aug 2011 15:16:43 +0200
References: <20110807204118.GA2203@ZenIV.linux.org.uk> <4E4254E1.5070909@suse.cz> <CA+55aFy9_menekFnwEPFVYb493m-_77HibPL4VXfd6-Jh4rzLA@mail.gmail.com>
In-Reply-To: <CA+55aFy9_menekFnwEPFVYb493m-_77HibPL4VXfd6-Jh4rzLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201108111516.44243.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, David Howells <dhowells@redhat.com>

On Wednesday 10 August 2011, Linus Torvalds wrote:
> Or you can do it by creating the default file, and then editing EVERY
> SINGLE ARCHITECTURE. Which just sucks.
> 
> This has come up before, for similar situations - wanting to implement
> optional architecture capabilities without having to worry about
> architectures that don't support it.

If you mostly care about new extensions, we can ignore all the
user ABI headers for now and find a solution that just deals with
the kernel internal ones.

I think the easiest way to do that would be to move all non-exported
headers from include/asm-generic to include/asm. Since it's only about
internel users then, we can simply use "#include_next <asm/foo.h>"
to refer to them from arch-specific files that want to reuse them
only partially and also add some of their own definitions.

	Arnd
