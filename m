Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34948 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbfCURUc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Mar 2019 13:20:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id t21so3971685pfe.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Mar 2019 10:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <7549EE7E-4172-467D-815A-63664A33D410@goodmis.org>
 <20190313211335.165605-1-ndesaulniers@google.com> <20190320191135.e49e976a8258c8ac0bb428c9@linux-foundation.org>
 <CAKwvOdn84HNEB3u4XO-V_+c=txmDd1061G_7K0zZVS4MfF--Lg@mail.gmail.com>
In-Reply-To: <CAKwvOdn84HNEB3u4XO-V_+c=txmDd1061G_7K0zZVS4MfF--Lg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 Mar 2019 10:20:18 -0700
Message-ID: <CAKwvOd=pJQ=SNJPSJjKZN+MY1P1gBjzT1V84T0rxV8ue9gC3xw@mail.gmail.com>
Subject: Re: [PATCH v4] lib/string.c: implement a basic bcmp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: clang-built-linux@googlegroups.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, Nathan Chancellor <natechancellor@gmail.com>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, Arnd Bergmann <arnd@arndb.de>, James Y Knight <jyknight@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, Namhyung Kim <namhyung@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>

On Thu, Mar 21, 2019 at 10:02 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Mar 20, 2019 at 7:11 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > I guess we should backport this into -stable so that older kernels can
> > be built with newer Clang.
>
> Ah, you're right.  I always forget.  Is it too late to add
>
> Cc: stable@vger.kernel.org
>
> to the patch in your tree?

Just noticed now. Thank you for adding it!
-- 
Thanks,
~Nick Desaulniers
