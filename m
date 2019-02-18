Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:21849 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728775AbfBRHV4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 02:21:56 -0500
MIME-Version: 1.0
References: <20190207123022.7961-1-2pi@mok.nu>
In-Reply-To: <20190207123022.7961-1-2pi@mok.nu>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 18 Feb 2019 16:20:52 +0900
Message-ID: <CAK7LNAQZ7PDZ4+uZu-FT4V8yw9oUGz6e++9xSshWJvALj3gN0Q@mail.gmail.com>
Subject: Re: [PATCH] modpost: file2alias: define size of alias
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mattias Jacobsson <2pi@mok.nu>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Mattias,

On Thu, Feb 7, 2019 at 9:31 PM Mattias Jacobsson <2pi@mok.nu> wrote:
>
> The size of the variable alias provided to do_entry functions are
> currently not readily available. Thus hindering do_entry functions to
> perform bounds checking.
>
> Define the macro ALIAS_SIZE containing the size of the variable alias.
>
> Signed-off-by: Mattias Jacobsson <2pi@mok.nu>


Sorry for late reply.

I can apply this to my kbuild tree shortly, but
it looks like a prerequisite for your
"platform/x86: wmi: use MODULE_DEVICE_TABLE() instead of MODULE_ALIAS()"


If you want all the patches to go through x86 platform-driver tree,
I am fine with that too.

Please let me know what you want.

Thanks.



-- 
Best Regards
Masahiro Yamada
