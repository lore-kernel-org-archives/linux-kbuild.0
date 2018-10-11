Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([5.9.137.197]:45910 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbeJKXAi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Oct 2018 19:00:38 -0400
Date: Thu, 11 Oct 2018 17:32:45 +0200
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] kbuild: Fail the build early when no lz4 present
Message-ID: <20181011153245.GD25435@zn.tnic>
References: <20181010222333.17794-1-bp@alien8.de>
 <CAK7LNAT2KpYkn=hj=h1XmbMJRdtgCQ__xP0X+Rpwm3e_Xs1brQ@mail.gmail.com>
 <20181011085234.GA25435@zn.tnic>
 <CAK7LNAS=Kr1W6SfwojEVdwpKy7Au9NRh-wd2Qfo5+aVQVDe9ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAS=Kr1W6SfwojEVdwpKy7Au9NRh-wd2Qfo5+aVQVDe9ZQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Oct 12, 2018 at 12:08:07AM +0900, Masahiro Yamada wrote:
> Install lz4c, and run 'make' again.
> Almost all objects have been built there,
> so you will finish it soon.

So when this LZ4 thing got added at the time, the lz4 package had to be
downloaded and built and installed and it wasn't as easy as zypper in
lz4 or apt-get install lz4.

And I *might* install it if there were a human readable error message
which would tell me so.

And we should strive to be as user-friendly as possible. And no, this:

/bin/sh: 1: lz4c: not found
make[2]: *** [arch/x86/boot/compressed/Makefile:145: arch/x86/boot/compressed/vmlinux.bin.lz4] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [arch/x86/boot/Makefile:112: arch/x86/boot/compressed/vmlinux] Error 2
make: *** [arch/x86/Makefile:290: bzImage] Error 2
make: *** Waiting for unfinished jobs....

is not user-friendly.

> If you are building up a compile-test machine,
> you will probably need to install various tools anyway.

Yes, and look how perf tool solves this. Much much better.

> I do not want to add ugly checks in random places.

That's fair.

What would be a fitting place to add such checks and be able to issue a
human-readable error message to people?

Btw, we fail the same cryptic way when there's no openSSL headers
installed on the system:

---
scripts/sign-file.c:25:10: fatal error: openssl/opensslv.h: No such file or directory
 #include <openssl/opensslv.h>
          ^~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.host:90: scripts/sign-file] Error 1
make[1]: *** Waiting for unfinished jobs....
scripts/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>
          ^~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.host:90: scripts/extract-cert] Error 1
make: *** [Makefile:1065: scripts] Error 2
make: *** Waiting for unfinished jobs....
---

and all those beginners who are trying to build the kernel for the first
time would have hard time figuring out what's expected of them.

Now look at perf tool:

Makefile.config:445: No sys/sdt.h found, no SDT events are defined, please install systemtap-sdt-devel or systemtap-sdt-dev
Makefile.config:491: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
Makefile.config:721: No bfd.h/libbfd found, please install binutils-dev[el]/zlib-static/libiberty-dev to gain symbol demangling

Much better IMO.

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
