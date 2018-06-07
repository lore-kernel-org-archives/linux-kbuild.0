Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34312 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753064AbeFGSwM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 14:52:12 -0400
Received: by mail-pg0-f66.google.com with SMTP id q4-v6so4117519pgr.1
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jun 2018 11:52:12 -0700 (PDT)
MIME-Version: 1.0
References: <20180605170532.170361-1-ndesaulniers@google.com>
 <20180605170532.170361-2-ndesaulniers@google.com> <202492204c2d5bd5ca27307cbca5e44673b739ed.camel@perches.com>
 <CAKwvOdkUk7ZL8tXgBs0Y+0Y5NVebgAYne_qgdSWWDOvQaWFPhw@mail.gmail.com> <28c288fd3e87b6c839697519043cf642518e0262.camel@perches.com>
In-Reply-To: <28c288fd3e87b6c839697519043cf642518e0262.camel@perches.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 Jun 2018 11:51:59 -0700
Message-ID: <CAKwvOdkDyVC02oXsTX9YYAFLw5Q+aFNWsAp911h6VdjMCYFwJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] compiler-gcc.h: add gnu_inline to all inline declarations
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joe@perches.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, akataria@vmware.com, boris.ostrovsky@oracle.com, brijesh.singh@amd.com, Cao jin <caoj.fnst@cn.fujitsu.com>, Greg KH <gregkh@linuxfoundation.org>, hpa@zytor.com, "J. Kiszka" <jan.kiszka@siemens.com>, jarkko.sakkinen@linux.intel.com, jgross@suse.com, Josh Poimboeuf <jpoimboe@redhat.com>, kirill.shutemov@linux.intel.com, mingo@redhat.com, mjg59@google.com, Matthias Kaehlcke <mka@chromium.org>, Philippe Ombredanne <pombredanne@nexb.com>, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, thomas.lendacky@amd.com, Thiebaud Weksteen <tweek@google.com>, linux-efi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, virtualization@lists.linux-foundation.org, Alistair Strachan <astrachan@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, sedat.dilek@gmail.com, tstellar@redhat.com, Kees Cook <keescook@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, geert@linux-m68k.org, Will Deacon <will.deacon@arm.com>, mawilcox@microsoft.com, Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>

On Thu, Jun 7, 2018 at 11:31 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2018-06-07 at 10:26 -0700, Nick Desaulniers wrote:
> > I get the feeling that the use of __inline__ or __inline (vs inline)
> > in the kernel may be wrong and their use should be eradicated in the
> > follow up patch set, but it would be cool if others have additional
> > insight.
>
> __inline is easy and useful to remove as it's used in
> just a few files.
>
> But __inline__ is used in a lot of files and locations:
>
> $ git grep -w --name-only __inline__ | wc -l
> 154
> $ git grep -w __inline__ | wc -l
> 503
>
> Some of these files are used in asm includes as
> well where __inline__ may be preferred by gcc
>
> https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords
>
> so perhaps asm exclusions would be necessary.

Oops, just saw this email after sending v3: https://lkml.org/lkml/2018/6/7/1055

Guess I should re-add __inline__ and __inline then to 1/3?
https://lkml.org/lkml/2018/6/7/1060

ie:

+#define __inline__ __inline__ inline
instead of
+#define __inline__ inline

?

On the other hand, I was able to assemble with gcc+binutils and v3 as it stands.

Reading the link you sent, it seems more about compiling with
-pedantic or non-gnu C standards being used (I'd call that unlikely
for the kernel). So it still seems incorrect to me the use of
__inline__ (but I do appreciate the link!) at least in the kernel.
