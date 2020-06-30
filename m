Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgF3TNH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 15:13:07 -0400
MIME-Version: 1.0
References: <20200629085911.1676554-1-masahiroy@kernel.org>
 <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com> <CAK7LNAR49jFZkEmBqpACE0V_-VyCXfFRcKe1Zq+cqO65QX1ozg@mail.gmail.com>
In-Reply-To: <CAK7LNAR49jFZkEmBqpACE0V_-VyCXfFRcKe1Zq+cqO65QX1ozg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2020 21:12:54 +0200
Message-ID: <CANiq72nE+1F3yM+e9XzfphzOe3mb9DUcRCAtPuLMyFE4Rh38pg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Clang build userprogs for target architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, clang-built-linux <clang-built-linux@googlegroups.com>

On Tue, Jun 30, 2020 at 6:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I can reproduce this in the following
> simple test code:
>
>
> ----------------->8----------------
> #include <stdio.h>
>
> int main(void)
> {
>         ssize_t x = 1;
>
>         printf("%zd", x);
>
>         return 0;
> }
> --------------->8-------------------

That is the old implicit int rule. Try including sys/types.h or
compiling with a standard like -std=c99 for instance.

Cheers,
Miguel
