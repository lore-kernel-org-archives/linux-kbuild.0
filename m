Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f51.google.com ([209.85.213.51]:33697 "EHLO
	mail-vk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754538AbcAHKDO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Jan 2016 05:03:14 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <568AF421.7050305@suse.cz>
References: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
	<20160104113318.700a9ed0@lxorguk.ukuu.org.uk>
	<CA+icZUUAoG0VeY06r_=c7aNGbuSkHp5VRHNSB=bQGTiTHShGtQ@mail.gmail.com>
	<568AF421.7050305@suse.cz>
Date: Fri, 8 Jan 2016 11:03:12 +0100
Message-ID: <CA+icZUWxfbPN4URoVdBAwm22sdKqGmTtiNBEg-KoHi-vgGqzqg@mail.gmail.com>
Subject: Re: Thoughts about introducing OPTIMIZATION_CFLAG
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

On Mon, Jan 4, 2016 at 11:37 PM, Michal Marek <mmarek@suse.cz> wrote:
> Dne 4.1.2016 v 12:47 Sedat Dilek napsal(a):
>> But I think you did not get my problem - to have two different
>> optimization-levels for a compiler in *one* make-line makes no sense
>> to me.
>
> That we sometimes have -O2 ... -Os on the command line is not a problem,
> since any same unix tool parses its options so that the last one of
> mutually exclusive options wins.

That is new to me and I haven't tested this by dropping arguments in
my make-line(s).

From where do have this information - sort of "business-life-experience" :-)?
Is that documented somewhere in the Linux-sources?

What means "last one" - last one seen from the begin-of-(make)-line?

Do you agree that it is confusing to have two optlevel arguments in
one make-line?

Linus suggested me to use a wrapper-script in case of using two
different compiler and passing arguments...

[  /usr/bin/mycompiler ]
#!/bin/bash

gcc-4.9 "$@"
- EOF -

According to your statement passing an optlevel here in this script
will never-ever be recognized - as it is at the begin-of-(make)-line.

So how should someone change the Linux-sources to test a different
optlevel than -O2?

I have also seen that below arch/x86 there exists hardcoded -O2 and
-Os which are placed after -O2 (default value from the
toplevel-Makefile).

Thoughts?

> As to -Os vs. -Oz, to my knowledge
> clang accepts both and -Oz means to reduce size by any means. If -Oz is
> more appropriate for the CONFIG_CC_OPTIMIZE_FOR_SIZE case and/or for the
> individual object files, feel free to change it, but please do not
> introduce another variable holding compiler options.
>

JUST FYI...
I was able to compile a llvmlinux-patched Linux v4.4.-rc8 with -Os and
CLANG v3.7.1.
Dunno the difference between -Os and -Oz.
The bug-line still exists with both.

Still I want to know if the problem exists with a different optlevel
like -O0 or -O1 or -O3.
Cannot say if all clang-specific compiler-flags will be available in
these optlevels.
( Testing with hardcoded -O0 ended in a build-breakage. )
That would be helpful to check if it is a compiler-optimization bug.

Can you help me in having a switchable value for the "default"
optlevel (which is currently -O2) in the Kconfig system?

We have CC_OPTIMIZE_FOR_SIZE in init/Kconfig.

What about a CC_OPTIMIZE_DEFAULT as a string in init/Kconfig?

[ init/Kconfig ]

config CC_OPTIMIZE_DEFAULT
        string
        default="-O2"

config CC_OPTIMIZE_FOR_SIZE
        bool "Optimize for size"
        help
          Enabling this option will pass "-Os" instead of "-O2" to
          your compiler resulting in a smaller kernel.

          If unsure, say N.

[ Makefile (top-level ]

OPTIMIZE_CFLAGS := $(subst $(quote),,$(CC_OPTIMIZE_DEFAULT))
...
KCONFIG_CFLAGS += $(OPTIMIZE_CFLAGS)
...

Unfortunately, that is not working as expected.

Something like the above would help not to hack in the Linux-sources
and pass elegantly a default-optlevel via Kconfig-system.

If there is an easier way of passing and using a different optlevel,
then please let me know.

Still digging in the dark on how to change to have one single optlevel.

Is it in general possible to "override" the default -O2
(toplevel-Makefile) for a specific part/subsystem?
Other possibilities than via the Kconfig-system?

Thanks in advance.

- Sedat -
