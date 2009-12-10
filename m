Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:43989 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760819AbZLJONO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Dec 2009 09:13:14 -0500
Message-ID: <4B2101BB.1010803@suse.cz>
Date: Thu, 10 Dec 2009 15:12:11 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [GIT PULL] kbuild updates for 2.6.33
References: <20091208133004.GA22750@sepie.suse.cz> <20091209093349.GA11837@sepie.suse.cz> <20091209093108.387b2736.randy.dunlap@oracle.com> <20091209192038.GA7827@merkur.ravnborg.org>
In-Reply-To: <20091209192038.GA7827@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On 9.12.2009 20:20, Sam Ravnborg wrote:
> On Wed, Dec 09, 2009 at 09:31:08AM -0800, Randy Dunlap wrote:
>> Hi > Michal,
>>
>> Is there anything that tells us when we should/must use
>> <generated/*.h> ?
> 
> The original idea was that include/generated/ should
> be used for all generated header files.
> 
> I once had a patch applied that used it for other
> generated files - this was a bad idea. Said patch
> was reverted as it had much bigger issues.
> 
> So think of it as a place for generated header files only.
> This also warrants the location in include/
> 
> But only for 'global' header files. For drivers
> and the like that needs the header file only locally the
> header file should not be located n include/generated,
> as it is only for the global headers.

... and if the question was rather "which #include lines need to be
fixed to use generated/": Most of the "global" generated headers are
used only in a handful of places mostly in arch and a bit in core kernel
code. The only drivers that needed updating were four staging drivers
that included <linux/autoconf.h> explicitely (dropping these includes
was a worthwhile cleanup on it's own) and one staging driver and said
iwlwifi which included <linux/utsrelease.h>. Also the rest of the series
is quite non-intrusive, it affects about 25 source files in arch/,
kernel/ and init/ + makefile cleanups. The most often included
asm/asm-offsets.h header is solved by a wrapper in arch/*/include/asm to
avoid unnecessary conflicts. The win is that we can get rid of the
include/asm symlink and the include2 thing in O= builds.

Michal
