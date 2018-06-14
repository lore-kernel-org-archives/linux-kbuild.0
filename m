Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:42444 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755348AbeFNU76 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 16:59:58 -0400
Received: by mail-pf0-f193.google.com with SMTP id w7-v6so3806712pfn.9
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jun 2018 13:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20180613210518.113983-1-ndesaulniers@google.com>
 <20180613210518.113983-3-ndesaulniers@google.com> <b027a324-ffae-fd5e-d8a3-03934be91a2d@zytor.com>
In-Reply-To: <b027a324-ffae-fd5e-d8a3-03934be91a2d@zytor.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Jun 2018 13:59:45 -0700
Message-ID: <CAKwvOdngs8k_T=nDKh8JYdAwwFoJRcCU0bZu0tJHQ+keZ5+RFQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] x86/asm: add _ASM_ARG* constants for argument
 registers to <asm/asm.h>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: hpa@zytor.com
Cc: Andrew Morton <akpm@linux-foundation.org>, mingo@redhat.com, Thomas Gleixner <tglx@linutronix.de>, linux-efi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, virtualization@lists.linux-foundation.org, Alistair Strachan <astrachan@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, sedat.dilek@gmail.com, tstellar@redhat.com, Kees Cook <keescook@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, geert@linux-m68k.org, Will Deacon <will.deacon@arm.com>, mawilcox@microsoft.com, Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>, acme@redhat.com, Philippe Ombredanne <pombredanne@nexb.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kate Stewart <kstewart@linuxfoundation.org>, boris.ostrovsky@oracle.com, "J. Kiszka" <jan.kiszka@siemens.com>, rostedt@goodmis.org, kirill.shutemov@linux.intel.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, akataria@vmware.com, brijesh.singh@amd.com, Cao jin <caoj.fnst@cn.fujitsu.com>, Greg KH <gregkh@linuxfoundation.org>, jarkko.sakkinen@linux.intel.com, jgross@suse.com, Josh Poimboeuf <jpoimboe@redhat.com>, Matthias Kaehlcke <mka@chromium.org>, thomas.lendacky@amd.com, Thiebaud Weksteen <tweek@google.com>, mjg59@google.com, joe@perches.com, andrea.parri@amarulasolutions.com, "H. Peter Anvin" <hpa@linux.intel.com>

On Thu, Jun 14, 2018 at 1:48 PM H. Peter Anvin <hpa@zytor.com> wrote:
>
> On 06/13/18 14:05, Nick Desaulniers wrote:
> > From: "H. Peter Anvin" <hpa@linux.intel.com>
> >
> > i386 and x86-64 uses different registers for arguments; make them
> > available so we don't have to #ifdef in the actual code.
> >
> > Native size and specified size (q, l, w, b) versions are provided.
> >
> > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I still object to Suggested-by: here.  Sedat did a correction, which is
> a Reviewed-by:, but unless I'm completely out to sea, there was no
> suggestion on Sedat's part of this; and I had certainly not seen it when
> I wrote the code.

I'm fine with changing it from a Suggested-by to a Reviewed-by.  Can
you do that when you apply the set, or should I send a v6?
-- 
Thanks,
~Nick Desaulniers
