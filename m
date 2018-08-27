Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38310 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbeH1Ayi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Aug 2018 20:54:38 -0400
Received: by mail-pg1-f193.google.com with SMTP id e2-v6so148117pgv.5
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Aug 2018 14:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180723122413.003644357@linuxfoundation.org> <20180723122413.797031305@linuxfoundation.org>
 <1535152080.2902.58.camel@codethink.co.uk>
In-Reply-To: <1535152080.2902.58.camel@codethink.co.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 27 Aug 2018 14:06:07 -0700
Message-ID: <CAKwvOd=8rVG5L8dzE5v_jj6o3gruRStxF=orX4jA+tzB=gf2Vg@mail.gmail.com>
Subject: Re: [PATCH 4.4 018/107] x86/paravirt: Make native_save_fl() extern inline
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ben.hutchings@codethink.co.uk
Cc: stable@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, hpa@zytor.com, tstellar@redhat.com, sedat.dilek@gmail.com, jgross@suse.com, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, acme@redhat.com, akataria@vmware.com, Andrew Morton <akpm@linux-foundation.org>, andrea.parri@amarulasolutions.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alistair Strachan <astrachan@google.com>, boris.ostrovsky@oracle.com, brijesh.singh@amd.com, Cao jin <caoj.fnst@cn.fujitsu.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Hackmann <ghackmann@google.com>, "J. Kiszka" <jan.kiszka@siemens.com>, jarkko.sakkinen@linux.intel.com, joe@perches.com, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@google.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Kate Stewart <kstewart@linuxfoundation.org>, linux-efi@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manoj Gupta <manojgupta@google.com>, mawilcox@microsoft.com, Michal Marek <michal.lkml@markovi.net>, mjg59@google.com, Matthias Kaehlcke <mka@chromium.org>, Philippe Ombredanne <pombredanne@nexb.com>, David Rientjes <rientjes@google.com>, rostedt@goodmis.org, thomas.lendacky@amd.com, Thiebaud Weksteen <tweek@google.com>, virtualization@lists.linux-foundation.org, Will Deacon <will.deacon@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Aug 24, 2018 at 4:08 PM Ben Hutchings
<ben.hutchings@codethink.co.uk> wrote:
>
> On Mon, 2018-07-23 at 14:41 +0200, Greg Kroah-Hartman wrote:
> > 4.4-stable review patch.  If anyone has any objections, please let me know.
> >
> > ------------------
> >
> > From: Nick Desaulniers <ndesaulniers@google.com>
> >
> > commit d0a8d9378d16eb3c69bd8e6d23779fbdbee3a8c7 upstream.
> >
> > native_save_fl() is marked static inline, but by using it as
> > a function pointer in arch/x86/kernel/paravirt.c, it MUST be outlined.
> >
> > paravirt's use of native_save_fl() also requires that no GPRs other than
> > %rax are clobbered.
> [...]
>
> Shouldn't native_restore_fl() be changed similarly?  You added an out-
> of-line definition, but it doesn't seem like it will actually be used.
>

Good catch, will send a patch with your reported by. Thank you for the report.
-- 
Thanks,
~Nick Desaulniers
