Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:54084 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751372AbeFZHNb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jun 2018 03:13:31 -0400
Date: Tue, 26 Jun 2018 09:13:25 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v6 3/3] x86: paravirt: make native_save_fl extern inline
Message-ID: <20180626071325.GA25751@gmail.com>
References: <20180621162324.36656-1-ndesaulniers@google.com>
 <20180621162324.36656-4-ndesaulniers@google.com>
 <20180622022402.GA24194@gmail.com>
 <CAKwvOdn5gnB5cK=cy6weKyxAn4SNEdZTT_MtT_D_nHRG5EDZ4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn5gnB5cK=cy6weKyxAn4SNEdZTT_MtT_D_nHRG5EDZ4g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: mingo@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, hpa@zytor.com, linux-efi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, virtualization@lists.linux-foundation.org, Alistair Strachan <astrachan@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, sedat.dilek@gmail.com, tstellar@redhat.com, Kees Cook <keescook@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, geert@linux-m68k.org, Will Deacon <will.deacon@arm.com>, mawilcox@microsoft.com, Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>, acme@redhat.com, Philippe Ombredanne <pombredanne@nexb.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kate Stewart <kstewart@linuxfoundation.org>, boris.ostrovsky@oracle.com, "J. Kiszka" <jan.kiszka@siemens.com>, rostedt@goodmis.org, kirill.shutemov@linux.intel.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, akataria@vmware.com, brijesh.singh@amd.com, Cao jin <caoj.fnst@cn.fujitsu.com>, Greg KH <gregkh@linuxfoundation.org>, jarkko.sakkinen@linux.intel.com, jgross@suse.com, Josh Poimboeuf <jpoimboe@redhat.com>, Matthias Kaehlcke <mka@chromium.org>, thomas.lendacky@amd.com, Thiebaud Weksteen <tweek@google.com>, mjg59@google.com, joe@perches.com, andrea.parri@amarulasolutions.com


* Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Thu, Jun 21, 2018 at 7:24 PM Ingo Molnar <mingo@kernel.org> wrote:
> > * Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > > native_save_fl() is marked static inline, but by using it as
> > > a function pointer in arch/x86/kernel/paravirt.c, it MUST be outlined.
> >
> > > --- a/arch/x86/include/asm/irqflags.h
> > > +++ b/arch/x86/include/asm/irqflags.h
> > > @@ -13,7 +13,7 @@
> > >   * Interrupt control:
> > >   */
> > >
> > > -static inline unsigned long native_save_fl(void)
> > > +extern inline unsigned long native_save_fl(void)
> > >  {
> > >       unsigned long flags;
> > >
> >
> > What's the code generation effect of this on say a defconfig kernel vmlinux with
> > paravirt enabled?
> 
> Starting with this patch set applied:
> $ make CC=gcc-8 -j46
> $ objdump -d vmlinux | grep native_save_fl --context=3
> ffffffff81059140 <native_save_fl>:
> ffffffff81059140: 9c                    pushfq
> ffffffff81059141: 58                    pop    %rax
> ffffffff81059142: c3                    retq
> $ git checkout HEAD~3
> $ make CC=gcc-8 -j46
> $ objdump -d vmlinux | grep native_save_fl --context=3
> ffffffff81079410 <native_save_fl>:
> ffffffff81079410: 9c                    pushfq
> ffffffff81079411: 58                    pop    %rax
> ffffffff81079412: c3                    retq
> 
> Mainly, this is to prevent the compiler from adding a stack protector
> to the outlined version, as the stack protector clobbers %rcx, but
> paravirt expects %rcx to be preserved. More info can be found:
> https://lkml.org/lkml/2018/5/24/1242--

Ok!

Acked-by: Ingo Molnar <mingo@kernel.org>

What's the planned upstreaming route for these patches/fixes?

Thanks,

	Ingo
