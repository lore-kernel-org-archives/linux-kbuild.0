Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:63794 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754305AbZJRMoC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 18 Oct 2009 08:44:02 -0400
MIME-Version: 1.0
In-Reply-To: <4ADACD3A.9020803@gmail.com>
References: <4ADACD3A.9020803@gmail.com>
Date: Sun, 18 Oct 2009 13:44:04 +0100
Message-ID: <9b2b86520910180544g94ecc8fuf0d7849e18cd8937@mail.gmail.com>
Subject: Re: Fast LKM symbol resolution with SysV ELH hash table
From: Alan Jenkins <sourcejedi.lkml@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: carmelo73@gmail.com
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 10/18/09, Carmelo Amoroso <carmelo73@gmail.com> wrote:
> Hi,
> I'm just sending this message to report about a work I've recently done
> to speed-up symbol resolution for modules by using a SysV ELF hash table
> (without relying upon binutils support).
> This work has been presented few days ago at the Embedded Linux Conference
> Europe.
>
> Patches are already publicly available for 2.6.23 kernel @STLinux git
> (http://git.stlinux.com/?p=stm/linux-sh4-2.6.23.y.git;a=summary)
>
> For 2.6.30 already ported but not yet available.
>
> Benchmarks have shown an average reduction of 96% in time spent for symbol
> resolution
> (that is 25x faster).
>
> All details can be found at
> http://tree.celinuxforum.org/CelfPubWiki/ELCEurope2009Presentations?action=AttachFile&do=view&target=C_AMOROSO_Fast_lkm_loader_ELC-E_2009.pdf
>
> I'm working to update them to mainline and post for review and discussion.
> We are also working right now to update this work too to use GNU hash
> instead of SysV ELF hash

Hi!

I found this very interesting.  I recently posted a prototype to use
binary search to optimize symbol lookup[1].  I guess it's unlikely for
more than one such optimization to be merged into mainline :).

The nice thing about binary search is that it doesn't require
increased memory structures.  You just have to sort the existing
tables (although it's easier said than done).  Anyway, this means I
didn't have to worry about making it optional, or being accused of
bloat.  I also managed to patch into the existing modpost run, instead
of adding another intermediate build step.

---
We should certainly expect hash tables to be faster.  Strictly
speaking our numbers are incomparable, because your test machine is a
bit different to my x86 netbook :).  I didn't even report the same
numbers.  That said, I have some saved "perf report" output, and it
_looks_ like using bsearch cut down find_symbol()+strcmp() by 96%
<grin>.

If look at the total savings hash tables made in your slides, I
actually get 98%.  I guess either the analysis was conservative or
there were more modules which were omitted for brevity.
---

Hypothetically: imagine we both finish our work and testing on the
same machine shows hash tables saving 100% and bsearch saving 90%.  In
absolute terms, hash tables might have an advantage of 0.03s on my
system (where bsearch saved 0.3s), and a total advantage of 0.015s for
the modules you tested (where hash tables saved ~0.15s).

Would you accept bsearch in this case?  Or would you feel that the
performance of hash tables outweighed the extra memory requirements?

(This leaves the question of why you need to load 0.015s worth of
always-needed in-tree kernel code as modules.  For those who haven't
read the slides, the  reasoning is that built-in code would take
_longer_ to load.  The boot-loader is often slower at IO, and it
doesn't allow other initialization to occur in parallel).

Warm regards
Alan

---
[1]  My bsearch prototype has several undisclosed problems which I'm
working on.   If you're curious you can find the patches by searching
"from:alan-jenkins@tuffmail.co.uk to:Rusty".  At the moment the series
is blocked on ARM.  I want to kill EXPORT_SYMBOL_ALIAS in armksyms.c,
because it breaks some simplifying assumptions I was relying on.

The protoype also limits the optimization to built-in symbols to avoid
extra modpost overhead.  However, this is an orthogonal decision - it
should not be hard to change if desired.
