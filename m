Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:47074 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbeJQMjq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Oct 2018 08:39:46 -0400
Subject: Re: [Lkcamp] [PATCH 0/4] Adds -Wshadow=local on KBUILD_HOSTCFLAGS
References: <20181017000722.GA20892@WindFlash>
From: Helen Koike <helen@koikeco.de>
Message-ID: <00beb3a2-e68d-4f6c-d69a-8413acc214c4@koikeco.de>
Date: Wed, 17 Oct 2018 01:45:54 -0300
MIME-Version: 1.0
In-Reply-To: <20181017000722.GA20892@WindFlash>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Leonardo_Br=c3=a1s?= <leobras.c@gmail.com>, lkcamp@lists.libreplanetbr.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, Matthew Wilcox <willy6545@gmail.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>

Hi Leonardo,

Thanks for the patches.

On 10/16/18 9:07 PM, Leonardo Brás wrote:
> This patchset add -Wshadow=local on KBUILD_HOSTCFLAGS and fixes 
> all code that show this warning.
> 
> The third patch was already submitted, but was not merged yet.
> I like to think it's part of this patchset, but if it was 
> already merged, please ignore it.

You can check if it was merged in the maintainers' tree, if it is not
there then it is not merged :)

imho, I would prefer if you submitted it as a v2 with an explanation of
what changed since v1 (e.g. new commits) or even stating that nothing
has changed and you just regrouped it.
Or better, you could also not re-submit it and just point out that this
series depends on a previous commit (with a link to it).

> 
> Leonardo Brás (4):
>   Adds -Wshadow=local on KBUILD_HOSTCFLAGS
>   Renames variable to fix shadow warning.
>   kbuild: Removes unnecessary shadowed local variable and optimize
>     testing.
>   Changes macro usage to avoid shadowing a variable.
> 
>  Makefile                     |  2 +-
>  arch/x86/entry/vdso/vdso2c.h |  4 ++--
>  scripts/asn1_compiler.c      |  7 +++----
>  scripts/mod/file2alias.c     | 14 ++++++++------
>  4 files changed, 14 insertions(+), 13 deletions(-)
> 

I hope this helps.

Regards,
Helen
