Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39629 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfHaHCS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Aug 2019 03:02:18 -0400
MIME-Version: 1.0
References: <20190829181231.5920-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190829181231.5920-1-yamada.masahiro@socionext.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 Aug 2019 09:02:04 +0200
Message-ID: <CANiq72neaWYEONu0Ww0enP2nU_KMCJuL5g0tzhgA0itCv-XpVg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: refactor scripts/Makefile.extrawarn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>, linux-kernel <linux-kernel@vger.kernel.org>

On Thu, Aug 29, 2019 at 8:13 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> +# W=1 - warnings that may be relevant and does not occur too often

s/does/do/

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
