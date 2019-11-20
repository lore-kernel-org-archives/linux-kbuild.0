Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from userp2120.oracle.com ([156.151.31.85]:41364 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbfKTAME (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Nov 2019 19:12:04 -0500
Subject: Re: [PATCH] kallsyms: new /proc/kallmodsyms with builtin modules and
 symbol sizes
References: <20191114223036.9359-1-eugene.loh@oracle.com>
 <20191115114708.2a784f8d@gandalf.local.home>
 <CAHk-=wjQBFTaEfHQNmrBQOLOLey5Goz01wJHTJKKLQm22ZyrJA@mail.gmail.com>
 <11861ca1-76c5-ed14-8ee1-f067c7e5b0c0@oracle.com>
 <CAHk-=wjoXE1tRVVwgDY=G8xXKCAxz8mfYBaTh8wF=QTFPRwmJQ@mail.gmail.com>
From: Eugene Loh <eugene.loh@oracle.com>
Message-ID: <e802475d-512a-77fb-9146-4b575df1f916@oracle.com>
Date: Tue, 19 Nov 2019 16:11:02 -0800
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjoXE1tRVVwgDY=G8xXKCAxz8mfYBaTh8wF=QTFPRwmJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Song Liu <songliubraving@fb.com>, Thomas Gleixner <tglx@linutronix.de>, jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kris Van Hees <kris.van.hees@oracle.com>, Nick Alcock <nick.alcock@oracle.com>

On 11/16/2019 04:32 PM, Linus Torvalds wrote:

> On Sat, Nov 16, 2019 at 9:58 AM Eugene Loh <eugene.loh@oracle.com> wrote:
>> Since there are very many gaps, adding dummy entries makes sense only
>> for "big" jumps.  I don't know where one would want to draw the line for
>> "big."  In any case, to identify such gaps, one would still need the "nm
>> -S" information provided by this patch.
> Sure. You can have some kind of error estimate where if the size of
> the thing is much smalle rthan the gap, add the fake padding object.
>
> But it "much smaller than" would likely be in the area of page
> alignment, not "next function was aligned to 64-byte boundary" kind of
> small fixups.
>
> Honestly, if somebody needs the real size, why aren't they just using
> the original image?
>
>> Meanwhile, there are some symbols that encompass others.
> Yeah, I don't think this is at all worth worrying about. Again, if you
> want that kind of information, you should use the original vmlinux
> image, not think that "hey, /proc should give perfect information".

We're also interested in systems that don't have vmlinux available -- 
e.g., production systems with kernels installed from vendor packages.

Nevertheless, I'll proceed along the lines you suggest.  I'll remove the 
size stuff and simply add the module info.  I prematurely sent a "v2" to 
this mail list.  Sorry.  Amended patch coming soon.

> The /proc interface should be a rought and convenient baseline, but I
> don't think it's at all interesting to try to make it perfect or even
> all that clever.
>
> Most of your questions boil down to "just use vmlinux" instead. If you
> _really_ care about things like "one symbol can encompass many
> sub-symbols", you shouldn't look at /proc/kallsyms.
>
> So I think we could improve on /proc/kallsuyms, but we should do it
> with the aim being "just make it incrementally better", not some
> "let's solve big problems". The big problems are already solved by
> just looking at the vmlinux file.
>
> For example, I think the whole "include which module the symbol comes
> from" is a nice improved quality thing even if the module happens to
> be built-in. If that is easy to do, then we should just do it, and it
> allows people to see interesting information and might make it useful
> to (for example) have tools like profiling be able to zoom into
> particular "modules", even if the module is built-in.
>
> And if there are big gaps that aren't just "align to next cacheline",
> then that sounds like it's worth pointing out too.
>
> But I see _zero_ reason not to say "just use vmlinux if you need
> detailed information". The /proc file is not supposed to be a
> replacement for the full setup, it should be seen as a convenient
> shorthand and as a "if you have nothing better, at least you can get
> _some_ information, and maybe you can also use it to validate that you
> have the _right_ vmlinux file"
>
>                   Linus
