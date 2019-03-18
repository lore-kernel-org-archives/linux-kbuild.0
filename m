Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44231 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbfCRJGF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 05:06:05 -0400
MIME-Version: 1.0
References: <CAK7LNAS5-e6QcJqSg_c2NBS=11ZZ-KFWLqDZYxWTu0wPFHg=cQ@mail.gmail.com>
In-Reply-To: <CAK7LNAS5-e6QcJqSg_c2NBS=11ZZ-KFWLqDZYxWTu0wPFHg=cQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Mar 2019 10:05:47 +0100
Message-ID: <CAK8P3a2CAHmiPe41fFh0vUR51G86UYtxqPjMzFFxigh6mSP_JA@mail.gmail.com>
Subject: Re: Enabling -Wint-in-bool-context
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, masahiroy@kernel.org

On Mon, Mar 18, 2019 at 9:46 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Arnd,
>
> I saw several commits from you
> fixing -Wint-in-bool-context warnings.
> Thanks!
>
>
> I guess we are almost ready to remove
>
> KBUILD_CFLAGS   += $(call cc-disable-warning, int-in-bool-context)
>
>
> In there any concern about re-enabling
> this warning?
>
>
> When I asked 0-day bot to test it some days ago,
> I just got a report
> for drivers/net/ethernet/mellanox/mlxsw/.
>
> Perhaps, you may have better test coverage
> and have noticed more warnings, though.

I had this enabled in my randconfig testing last year, but not after
rebasing on linux-4.20. My plan was always to enable the warning
(and a few others) eventually, but this was part of my idea for
a larger-scale rework of how we handle warnings in the kernel,
and I never got around to implementing that.

I've turned it on manually again now, will let you know if something
comes up, but I expect that we can simply do it and fix any
warnings as they come up.

      Arnd
