Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:35006 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfDII3n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Apr 2019 04:29:43 -0400
Received: by mail-vs1-f68.google.com with SMTP id d8so9294914vsp.2
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2019 01:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190408170418.148554-1-glider@google.com> <20190408170418.148554-2-glider@google.com>
 <adb23353-2e02-ecd2-7506-50f4db814b25@infradead.org>
In-Reply-To: <adb23353-2e02-ecd2-7506-50f4db814b25@infradead.org>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 9 Apr 2019 10:29:30 +0200
Message-ID: <CAG_fn=V2aMoWnKfqC7eomEgFtjedcfmF0O2FF-ZPxC9x0aMDcg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] initmem: introduce CONFIG_INIT_ALL_MEMORY and CONFIG_INIT_ALL_STACK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module <linux-security-module@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Kostya Serebryany <kcc@google.com>, Dmitriy Vyukov <dvyukov@google.com>, Kees Cook <keescook@chromium.org>, Sandeep Patil <sspatil@android.com>, Kernel Hardening <kernel-hardening@lists.openwall.com>

On Tue, Apr 9, 2019 at 12:15 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 4/8/19 10:04 AM, Alexander Potapenko wrote:
> > diff --git a/security/Kconfig.initmem b/security/Kconfig.initmem
> > new file mode 100644
> > index 000000000000..5e49a55382ad
> > --- /dev/null
> > +++ b/security/Kconfig.initmem
> > @@ -0,0 +1,29 @@
> > +menu "Initialize all memory"
> > +
> > +config CC_HAS_AUTO_VAR_INIT
> > +     def_bool $(cc-option,-ftrivial-auto-var-init=3Dpattern)
> > +
> > +config INIT_ALL_MEMORY
> > +     bool "Initialize all memory"
> > +     default n
> > +     help
> > +       Enforce memory initialization to mitigate infoleaks and make
> > +       the control-flow bugs depending on uninitialized values more
> > +       deterministic.
> > +
> > +if INIT_ALL_MEMORY
> > +
> > +config INIT_ALL_STACK
> > +     bool "Initialize all stack"
> > +     depends on INIT_ALL_MEMORY
>
> This "depends on" is redundant with the "if INIT_ALL_MEMORY" above it.
Ack, thank you!
> Similar comment for patch 2/2 and INIT_ALL_HEAP.
>
> > +     depends on CC_HAS_AUTO_VAR_INIT || (HAVE_GCC_PLUGINS && PLUGIN_HO=
STCC !=3D "")
> > +     select GCC_PLUGINS if !CC_HAS_AUTO_VAR_INIT
> > +     select GCC_PLUGIN_STRUCTLEAK if !CC_HAS_AUTO_VAR_INIT
> > +     select GCC_PLUGIN_STRUCTLEAK_BYREF_ALL if !CC_HAS_AUTO_VAR_INIT
> > +     default y
> > +     help
> > +       Initialize uninitialized stack data with a fixed pattern
> > +       (0x00 in GCC, 0xAA in Clang).
> > +
> > +endif # INIT_ALL_MEMORY
> > +endmenu
>
>
> --
> ~Randy



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
