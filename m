Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37366 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753260AbeFGUQJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 16:16:09 -0400
Received: by mail-pg0-f67.google.com with SMTP id r21-v6so4943579pgv.4
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jun 2018 13:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180607183219.192973-1-ndesaulniers@google.com>
 <20180607183219.192973-3-ndesaulniers@google.com> <2f7fc4bf-d0fe-0d3a-ffdd-02cc82c83747@linux.intel.com>
In-Reply-To: <2f7fc4bf-d0fe-0d3a-ffdd-02cc82c83747@linux.intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 Jun 2018 13:15:55 -0700
Message-ID: <CAKwvOdkhoOG=Ki-hLL-GtE_++TJ_fy6G_D+xER_vS-aZSjH61A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] x86/asm: add _ASM_ARG* constants for argument
 registers to <asm/asm.h>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hpa@zytor.com, mingo@redhat.com, Thomas Gleixner <tglx@linutronix.de>, linux-efi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, virtualization@lists.linux-foundation.org, Alistair Strachan <astrachan@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, sedat.dilek@gmail.com, tstellar@redhat.com, Kees Cook <keescook@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, geert@linux-m68k.org, Will Deacon <will.deacon@arm.com>, mawilcox@microsoft.com, Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>, acme@redhat.com, Philippe Ombredanne <pombredanne@nexb.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kate Stewart <kstewart@linuxfoundation.org>, boris.ostrovsky@oracle.com, "J. Kiszka" <jan.kiszka@siemens.com>, rostedt@goodmis.org, kirill.shutemov@linux.intel.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>, akataria@vmware.com, brijesh.singh@amd.com, Cao jin <caoj.fnst@cn.fujitsu.com>, Greg KH <gregkh@linuxfoundation.org>, jarkko.sakkinen@linux.intel.com, jgross@suse.com, Josh Poimboeuf <jpoimboe@redhat.com>, Matthias Kaehlcke <mka@chromium.org>, thomas.lendacky@amd.com, Thiebaud Weksteen <tweek@google.com>, mjg59@google.com, joe@perches.com

On Thu, Jun 7, 2018 at 1:14 PM H. Peter Anvin <hpa@linux.intel.com> wrote:
>
> On 06/07/18 11:32, Nick Desaulniers wrote:
> >
> > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> If this was suggested by Sedat, I didn't see that suggestion...

I took his suggestion which was to fix the typo in the commit message.
https://lkml.org/lkml/2018/6/5/776

-- 
Thanks,
~Nick Desaulniers
