Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f52.google.com ([209.85.213.52]:34069 "EHLO
	mail-vk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753240AbcADLrn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Jan 2016 06:47:43 -0500
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
In-Reply-To: <20160104113318.700a9ed0@lxorguk.ukuu.org.uk>
References: <CA+icZUVEs_+XiWeqtJ+34HBSx5LJYyEgoo2DLFzVr6yc9oxx2Q@mail.gmail.com>
	<20160104113318.700a9ed0@lxorguk.ukuu.org.uk>
Date: Mon, 4 Jan 2016 12:47:42 +0100
Message-ID: <CA+icZUUAoG0VeY06r_=c7aNGbuSkHp5VRHNSB=bQGTiTHShGtQ@mail.gmail.com>
Subject: Re: Thoughts about introducing OPTIMIZATION_CFLAG
From: Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, linux-kbuild@vger.kernel.org, Linux ACPI <linux-acpi@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>

On Mon, Jan 4, 2016 at 12:33 PM, One Thousand Gnomes
<gnomes@lxorguk.ukuu.org.uk> wrote:
>> As said... I checked only for x86 and acpi only.
>>
>> For example '-Os' is hardcoded in...
>>
>> arch/x86/Makefile
>> arch/x86/purgatory/Makefile
>>
>> drivers/acpi/Makefile
>> drivers/acpi/acpica/Makefile
>>
>> For acpi part we have currently both used '-O2' and '-Os' ('-Oz' for
>> llvmlinux) in approx 200 make-lines.
>
> Certain parts of the kernel are built in particular ways for specific
> reasons where the tradeoffs vary, or where people happen to know that -Os
> is the best choice with gcc. Of course those may not be the same trade
> offs for llvm.
>
>>
>> $ grep '\-O2' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi | wc -l
>> 226
>> $ grep '\-Oz' build-log_4.4.0-rc8-2-llvmlinux-amd64.txt | grep acpi |
>> grep '\-O2' | wc -l
>> 200
>>
>> So, which optimization-cflags is now used if I have both in one
>> make-line (and how can I check this)?
>
> Consult the documentation for your compiler. GCC has an 810 page manual
> that answers your question quite specifically
>
>   "If you use multiple -O options with or without level numbers, the last
>    such option is the one that is effective"
>
>
> Don't assume they are contradictory options either. If you have other
> optimnisations directly set then if those are after it they will take
> effect
>
> eg -Os -fprefetch-loop-arrays
>
> is quite valid.
>
> The GCC manual lists each optimisation it supports and documents exactly
> which ones are enabled for each option. From that you should be able to
> match them up with llvm.
>
>> How can I switch a optimization-cflags for certain code-parts in the
>> Linux-kernel (with or without the kbuild-system)?
>> ( So the default optimization-cflags is '-O2' whereas parts wants '-Os'. )
>
> Not sure I follow - that's exactly what the current Makefiles are doing.
>
>> What to do when using CONFIG_CC_OPTIMIZE_FOR_SIZE=y which sets '-Os' explicitly?
>
> That's something you'd need to work out as you regression test and profile
> the codebase. A first guess would be to echo what gcc does but deal with
> the unfortunate option difference between llvm and gcc.
>
> It may also depend what "optimising for size" means to llvm. Some
> compilers take it as a hint to favour smaller but still fast code, others
> take it as an instruction to generate very tight but way slower code.
> That will change which bits need which options.
>

Thanks for your reply.

But I think you did not get my problem - to have two different
optimization-levels for a compiler in *one* make-line makes no sense
to me.

So, the kbuild-system adds optimization compiler-flags automatically -
see the upper/root Makefile.
Sort of "inheritance".

My question is how to set *one* optimization-level for whatever
compiler I use to build my Linux-kernel source.

-O1 || -O2 || -O3 || -O4 || -Os ('1..4' and 's' are so-called "optlevels")

It's still not clear if my problem is a compiler bug or not (see [1]
for the details).

Now a bit clearer?

- Sedat -

[1] http://marc.info/?t=144179442100006&r=1&w=1
