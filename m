Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:48777 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgFFA2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Jun 2020 20:28:00 -0400
MIME-Version: 1.0
References: <20200531084707.1238909-1-masahiroy@kernel.org> <20200605141059.E85BA2074B@mail.kernel.org>
In-Reply-To: <20200605141059.E85BA2074B@mail.kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 6 Jun 2020 09:26:49 +0900
Message-ID: <CAK7LNAQwJk1RN=DDYUhMCZ=7oDLDb2mfZ7U8O7EEAT8ghFh3WQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: force to build vmlinux if CONFIG_MODVERSION=y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable <stable@vger.kernel.org>

Hi.

On Fri, Jun 5, 2020 at 11:11 PM Sasha Levin <sashal@kernel.org> wrote:
>
> Hi
>
> [This is an automated email]
>
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: 2.5.71+
>
> The bot has tested the following trees: v5.6.15, v5.4.43, v4.19.125, v4.14.182, v4.9.225, v4.4.225.
>
> v5.6.15: Build OK!
> v5.4.43: Build OK!
> v4.19.125: Build OK!
> v4.14.182: Build OK!
> v4.9.225: Failed to apply! Possible dependencies:
>     2c1f4f125159 ("kbuild: re-order the code to not parse unnecessary variables")
>     312a3d0918bb ("kbuild: trivial cleanups on the comments")
>     a9d9a400e075 ("kbuild: split exported generic header creation into uapi-asm-generic")
>
> v4.4.225: Failed to apply! Possible dependencies:
>     23121ca2b56b ("kbuild: create/adjust generated/autoksyms.h")
>     2441e78b1919 ("kbuild: better abstract vmlinux sequential prerequisites")
>     2c1f4f125159 ("kbuild: re-order the code to not parse unnecessary variables")
>     2e8d696b79e9 ("kbuild: drop FORCE from PHONY targets")
>     312a3d0918bb ("kbuild: trivial cleanups on the comments")
>     a9d9a400e075 ("kbuild: split exported generic header creation into uapi-asm-generic")
>     b9ab5ebb14ec ("objtool: Add CONFIG_STACK_VALIDATION option")
>     ba79d401f1ae ("kbuild: fix call to adjust_autoksyms.sh when output directory specified")
>     dd92478a15fa ("kbuild: build sample modules along with the rest of the kernel")
>     fbe6e37dab97 ("kbuild: add arch specific post-link Makefile")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?


I will send a pull request to Linus shortly.

After it hands, please cherry-pick it
for v4.14, v4.19, v5.4, v5.6


I will resolve the conflict and send a patch
for v4.4 and v4.9 later.

Thanks.





-- 
Best Regards
Masahiro Yamada
