Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34837 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750813AbdLRLIX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Dec 2017 06:08:23 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQT-e+wbcNCy6F0KvEfUnGpHs_p8+ybQ=yor+mAXoaDFQ@mail.gmail.com>
References: <20171205153259.2522368-1-arnd@arndb.de> <CAK7LNAQT-e+wbcNCy6F0KvEfUnGpHs_p8+ybQ=yor+mAXoaDFQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Dec 2017 12:08:22 +0100
Message-ID: <CAK8P3a3g3c_AJ6hEFQ3BYa=3cF97FFNN-EeTzWBwD=30EGe4eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] [RFC] kbuild: add macro for controlling warnings to linux/compiler.h
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Douglas Anderson <dianders@chromium.org>, Al Viro <viro@zeniv.linux.org.uk>, Heiko Carstens <heiko.carstens@de.ibm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Matthew Wilcox <matthew@wil.cx>, Matthias Kaehlcke <mka@chromium.org>, Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Gideon Israel Dsouza <gidisrael@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Dec 18, 2017 at 10:48 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-12-06 0:32 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> I have occasionally run into a situation where it would make sense to
>> control a compiler warning from a source file rather than doing so from
>> a Makefile using the $(cc-disable-warning, ...) or $(cc-option, ...)
>> helpers.
>>
>> The approach here is similar to what glibc uses, using __diag() and
>> related macros to encapsulate a _Pragma("GCC diagnostic ...") statement
>> that gets turned into the respective "#pragma GCC diagnostic ..." by
>> the preprocessor when the macro gets expanded.
>>
>> Like glibc, I also have an argument to pass the affected compiler
>> version, but decided to actually evaluate that one. For now, this
>> supports GCC_4_6, GCC_4_7, GCC_4_8, GCC_4_9, GCC_5, GCC_6, GCC_7,
>> GCC_8 and GCC_9. Adding support for CLANG_5 and other interesting
>> versions is straightforward here. GNU compilers starting with gcc-4.2
>> could support it in principle, but "#pragma GCC diagnostic push"
>> was only added in gcc-4.6, so it seems simpler to not deal with those
>> at all. The same versions show a large number of warnings already,
>> so it seems easier to just leave it at that and not do a more
>> fine-grained control for them.
>>
>> The use cases I found so far include:
>>
>> - turning off the gcc-8 -Wattribute-alias warning inside of the
>>   SYSCALL_DEFINEx() macro without having to do it globally.
>>
>> - Reducing the build time for a simple re-make after a change,
>>   once we move the warnings from ./Makefile and
>>   ./scripts/Makefile.extrawarn into linux/compiler.h
>
> Do you mean, list default warnings in linux/compiler.h
>
> like
>
> __diag_ignore(GCC_*, "-Wunused-but-set-variable");
> __diag_ignore(GCC_*, "-Wunused-const-variable");
>
> instead of
>
> KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-but-set-variable)
> KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-const-variable)
>
> Is this what you mean?

In principle yes, though my plan was a bit more sophisticated than this:
I want to make those definitions specific to both the W=3D level and the co=
mpiler
version, so you can say things like

KBUILD_WARN(0, GCC_4_6, "-Wall")
KBUILD_WARN(0, CLANG5, "-Wall")

KBUILD_WARN(1, GCC_4_6, "-Wextra")
KBUILD_WARN(1, CLANG5, "-Wextra")

KBUILD_WARN(2, CLANG5, "-Wmost")

KBUILD_WARN(3, CLANG5, "-Weverything")

With the above, "make W=3D12 E=3D01" should would lead to
-Wall and -Wextra warnings to become errors on all compilers,
but also enable -Wmost as warnings rather than errors on clang.

> I wonder if we should for all files to include <linux/compiler.h>...

I assumed we already did that, but maybe I was wrong here. I see
that we include include/linux/kconfig.h everywhere, but I don't see
that for compiler.h. This would obviously be a requirement to do first.

>> This patch for now just adds the minimal infrastructure in order to
>> do the first of the list above. As the #pragma GCC diagnostic
>> takes precedence over command line options, the next step would be
>> to convert a lot of the individual Makefiles that set nonstandard
>> options to use __diag() instead.
>
>
> GCC manual says:
>   Note that not all diagnostics are modifiable; at the moment only warnin=
gs
>   (normally controlled by =E2=80=98-W=E2=80=A6=E2=80=99) can be controlle=
d, and not all of them.
>
> https://gcc.gnu.org/onlinedocs/gcc/Diagnostic-Pragmas.html#Diagnostic-Pra=
gmas
>
>
> Actually, my compiler does not react
> to __diag_*(GCC_*, "-Wunused-but-set-variable") at all.
>
> Is it possible to replace command line flags?

My interpretation was that everything that had a -W option could be control=
led
with a pragma as well. While we can turn any warning into an error, we cann=
ot
turn most errors into warnings.

When I experimented with this a couple of months ago, I also saw that
"gcc -Q --help=3Dwarnings" reports some warnings that are language
specific, and it refuses to enable e.g. a fortran specific warning when
building a C file.

> For linux/compiler-intel.h case,
> these macros are not defined at all,
> so __diag_ignore(GCC_*, ...) will cause compile error.

Right, that would need to be fixed. I think it's ok to just ignore all
those statements and just continue with the default warnings.

> Clang includes linux/compiler-gcc.h as well,
> so it should be OK.
>
> Interestingly, clang also defines GCC version,
> but I have no idea the correspondence between
> gcc version vs. clang version.

I tried clang-3.9 and clang-5, both of which report compatibility with
gcc-4.2.1. It seems that for the most part, clang tries to implement
the  gcc warning options, but there are always some it does not have.
I can probably come up with a list of warning options that all
supported versions of either gcc or clang understand, and have
those set independent of the version, but for all others require
listing the specific version that introduces it. In some cases a
warning gets introduced in one version but isn't actually usable
until a later version.

       Arnd
