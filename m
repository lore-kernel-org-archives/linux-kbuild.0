Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:43933 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbcADLds (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2016 06:33:48 -0500
Date: Mon, 4 Jan 2016 11:33:18 +0000
From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: Thoughts about introducing OPTIMIZATION_CFLAG
Message-ID: <20160104113318.700a9ed0@lxorguk.ukuu.org.uk>
In-Reply-To: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
References: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

> As said... I checked only for x86 and acpi only.
> 
> For example '-Os' is hardcoded in...
> 
> arch/x86/Makefile
> arch/x86/purgatory/Makefile
> 
> drivers/acpi/Makefile
> drivers/acpi/acpica/Makefile
> 
> For acpi part we have currently both used '-O2' and '-Os' ('-Oz' for
> llvmlinux) in approx 200 make-lines.

Certain parts of the kernel are built in particular ways for specific
reasons where the tradeoffs vary, or where people happen to know that -Os
is the best choice with gcc. Of course those may not be the same trade
offs for llvm.

> 
> $ grep '\-O2' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi | wc -l
> 226
> $ grep '\-Oz' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi |
> grep '\-O2' | wc -l
> 200
> 
> So, which optimization-cflags is now used if I have both in one
> make-line (and how can I check this)?

Consult the documentation for your compiler. GCC has an 810 page manual
that answers your question quite specifically

  "If you use multiple -O options with or without level numbers, the last
   such option is the one that is effective"


Don't assume they are contradictory options either. If you have other
optimnisations directly set then if those are after it they will take
effect

eg -Os -fprefetch-loop-arrays

is quite valid.

The GCC manual lists each optimisation it supports and documents exactly
which ones are enabled for each option. From that you should be able to
match them up with llvm.

> How can I switch a optimization-cflags for certain code-parts in the
> Linux-kernel (with or without the kbuild-system)?
> ( So the default optimization-cflags is '-O2' whereas parts wants '-Os'. )

Not sure I follow - that's exactly what the current Makefiles are doing.

> What to do when using CONFIG_CC_OPTIMIZE_FOR_SIZE=y which sets '-Os' explicitly?

That's something you'd need to work out as you regression test and profile
the codebase. A first guess would be to echo what gcc does but deal with
the unfortunate option difference between llvm and gcc.

It may also depend what "optimising for size" means to llvm. Some
compilers take it as a hint to favour smaller but still fast code, others
take it as an instruction to generate very tight but way slower code.
That will change which bits need which options.

Alan


