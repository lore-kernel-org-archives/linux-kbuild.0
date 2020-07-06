Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgGFEtM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 00:49:12 -0400
MIME-Version: 1.0
References: <20200629085911.1676554-1-masahiroy@kernel.org>
 <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com>
 <CAK7LNAR49jFZkEmBqpACE0V_-VyCXfFRcKe1Zq+cqO65QX1ozg@mail.gmail.com>
 <CANiq72nE+1F3yM+e9XzfphzOe3mb9DUcRCAtPuLMyFE4Rh38pg@mail.gmail.com> <CAK7LNATRAuEXp+Wz7f_VUTSFS4jqmdTE4Xugi1MZozimsj6zuA@mail.gmail.com>
In-Reply-To: <CAK7LNATRAuEXp+Wz7f_VUTSFS4jqmdTE4Xugi1MZozimsj6zuA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Jul 2020 06:48:58 +0200
Message-ID: <CANiq72=LOgebNs7kwLGrkgsM2pr=dQG4F1VWskdndAh39jHWcw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Clang build userprogs for target architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, clang-built-linux <clang-built-linux@googlegroups.com>

Hi Masahiro,

On Sun, Jul 5, 2020 at 5:30 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hmm, adding '#include <sys/types.h>' did not make any difference.

That should have worked, because POSIX defines it to be there. It
sounds like you need --sysroot to point it to the proper ones.

> If I add -std=c99, I get a different error.

Yeah, that is the expected behavior. C99 does not have the implicit
int rule anymore (unlike older C) so ssize_t (an unknown type given
that program) is not being interpreted as int anymore (which is what
triggers the warning later about the mismatch between size_t and int
in the format string).

> In contrast, 'size_t' has no problem.

That is expected too, because size_t is defined via stdio.h (size_t is
a C standard type, ssize_t is not -- it is a POSIX one).

Hope that helps,

Cheers,
Miguel
