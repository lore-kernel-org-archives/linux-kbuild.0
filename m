Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:36745 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751760AbdHSRDw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Aug 2017 13:03:52 -0400
MIME-Version: 1.0
In-Reply-To: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Aug 2017 10:03:51 -0700
Message-ID: <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

On Sat, Aug 19, 2017 at 1:49 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Here is one question.  Is it acceptable to use those rules all the time?
> That is, generate those C files by flex, bison, gperf during the
> kernel building.

Yeah, I think we probably should do that.

However, when I just tested, I noticed that we have issues with
re-generating those files. With gperf 3.1 installed, I get

  In file included from scripts/kconfig/zconf.tab.c:213:0:
  scripts/kconfig/zconf.gperf:147:1: error: conflicting types for
=E2=80=98kconf_id_lookup=E2=80=99
  scripts/kconfig/zconf.gperf:12:31: note: previous declaration of
=E2=80=98kconf_id_lookup=E2=80=99 was here
   static const struct kconf_id *kconf_id_lookup(register const char
*str, register unsigned int len);
                                 ^~~~~~~~~~~~~~~

because gperf now generates

   const struct kconf_id *
  -kconf_id_lookup (register const char *str, register unsigned int len)
  +kconf_id_lookup (register const char *str, register size_t len)

and I'm not sure how to detect that automatically. It seems to be a
gperf-3.1 change, and gperf doesn't seem to generate any version
markers.

Working around that, I hit:

  In file included from scripts/genksyms/lex.lex.c:1921:0:
  scripts/genksyms/keywords.gperf:54:1: error: conflicting types for
=E2=80=98is_reserved_word=E2=80=99
   static, STATIC_KEYW
   ^~~~~~~~~~~~~~~~
  In file included from scripts/genksyms/lex.lex.c:1921:0:
  scripts/genksyms/keywords.gperf:6:30: note: previous declaration of
=E2=80=98is_reserved_word=E2=80=99 was here
   static const struct resword *is_reserved_word(register const char
*str, register unsigned int len);
                              ^~~~~~~~~~~~~~~~

so we have at least two cases of this in the source tree.

So one of the advantages of the pre-shipped files is that we can avoid
that kind of crazy version issues with the tools.

But if we can solve the versioning thing easily, I certainly don't
mind getting rid of the pre-generated files. Having to have
flex/bison/gperf isn't a huge onus on the kernel build system.

              Linus
