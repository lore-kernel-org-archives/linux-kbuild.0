Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:44552 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933041AbeFGR3X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 13:29:23 -0400
Received: by mail-pg0-f68.google.com with SMTP id p21-v6so5072836pgd.11
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Jun 2018 10:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180605170532.170361-1-ndesaulniers@google.com>
 <20180605170532.170361-2-ndesaulniers@google.com> <202492204c2d5bd5ca27307cbca5e44673b739ed.camel@perches.com>
 <CAKwvOdkUk7ZL8tXgBs0Y+0Y5NVebgAYne_qgdSWWDOvQaWFPhw@mail.gmail.com>
In-Reply-To: <CAKwvOdkUk7ZL8tXgBs0Y+0Y5NVebgAYne_qgdSWWDOvQaWFPhw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 Jun 2018 10:29:10 -0700
Message-ID: <CAKwvOdm5_ZuPSPqvfsz1fpm3Z--Tvun3rZ_iQJUE=xegHT149w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] compiler-gcc.h: add gnu_inline to all inline declarations
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: joe@perches.com
Cc: Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, akataria@vmware.com, boris.ostrovsky@oracle.com, brijesh.singh@amd.com, Cao jin <caoj.fnst@cn.fujitsu.com>, Greg KH <gregkh@linuxfoundation.org>, hpa@zytor.com, "J. Kiszka" <jan.kiszka@siemens.com>, jarkko.sakkinen@linux.intel.com, jgross@suse.com, Josh Poimboeuf <jpoimboe@redhat.com>, kirill.shutemov@linux.intel.com, mingo@redhat.com, mjg59@google.com, Matthias Kaehlcke <mka@chromium.org>, Philippe Ombredanne <pombredanne@nexb.com>, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, thomas.lendacky@amd.com, Thiebaud Weksteen <tweek@google.com>, linux-efi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, virtualization@lists.linux-foundation.org, Alistair Strachan <astrachan@google.com>, Manoj Gupta <manojgupta@google.com>, Greg Hackmann <ghackmann@google.com>, sedat.dilek@gmail.com, tstellar@redhat.com, Kees Cook <keescook@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, geert@linux-m68k.org, Will Deacon <will.deacon@arm.com>, mawilcox@microsoft.com, Arnd Bergmann <arnd@arndb.de>, David Rientjes <rientjes@google.com>

On Thu, Jun 7, 2018 at 10:26 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Jun 5, 2018 at 10:23 AM Joe Perches <joe@perches.com> wrote:
> >
> > On Tue, 2018-06-05 at 10:05 -0700, Nick Desaulniers wrote:
> > > Functions marked extern inline do not emit an externally visible
> > > function when the gnu89 C standard is used. Some KBUILD Makefiles
> > > overwrite KBUILD_CFLAGS. This is an issue for GCC 5.1+ users as without
> > > an explicit C standard specified, the default is gnu11. Since c99, the
> > > semantics of extern inline have changed such that an externally visible
> > > function is always emitted. This can lead to multiple definition errors
> > > of extern inline functions at link time of compilation units whose build
> > > files have removed an explicit C standard compiler flag for users of GCC
> > > 5.1+ or Clang.
> > []
> > > diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> > []
> > > @@ -72,17 +72,24 @@
> > >   * -Wunused-function.  This turns out to avoid the need for complex #ifdef
> > >   * directives.  Suppress the warning in clang as well by using "unused"
> > >   * function attribute, which is redundant but not harmful for gcc.
> > > + * Prefer gnu_inline, so that extern inline functions do not emit an
> > > + * externally visible function. This makes extern inline behave as per gnu89
> > > + * semantics rather than c99. This prevents multiple symbol definition errors
> > > + * of extern inline functions at link time.
> > >   */
> > >  #if !defined(CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING) ||             \
> > >      !defined(CONFIG_OPTIMIZE_INLINING) || (__GNUC__ < 4)
> > > -#define inline inline                __attribute__((always_inline,unused)) notrace
> > > -#define __inline__ __inline__        __attribute__((always_inline,unused)) notrace
> > > -#define __inline __inline    __attribute__((always_inline,unused)) notrace
> > > +#define inline \
> > > +     inline __attribute__((always_inline, unused, gnu_inline)) notrace
> > > +#define __inline__ \
> > > +     __inline__ __attribute__((always_inline, unused, gnu_inline)) notrace
> > > +#define __inline \
> > > +     __inline __attribute__((always_inline, unused, gnu_inline)) notrace
> >
> > Perhaps these are simpler as
> >
> > #define __inline__      inline
> > #define __inline        inline
>
> Probably want:
>
> #define __inline__ __inline__ inline
> #define __inline __inline inline

Oh, never mind, if my changes to `inline` add the `inline` keyword,
then we can remove the redefinition __inline__ and __inline.  All that
to say your original suggestion is better than my follow up.
-- 
Thanks,
~Nick Desaulniers
