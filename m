Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:63699 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726023AbfLZJ0E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Dec 2019 04:26:04 -0500
MIME-Version: 1.0
References: <1577253483-24358-1-git-send-email-fanliangcai9@gmail.com>
In-Reply-To: <1577253483-24358-1-git-send-email-fanliangcai9@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Dec 2019 18:25:12 +0900
Message-ID: <CAK7LNAS7Jj0=abxAH4K41BkBfrOLjygBo0KvXyVUO2b240bCww@mail.gmail.com>
Subject: Re: [PATCH] use bash instead of sh to run mkcompile_h
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Liangcai Fan <fanliangcai9@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, zhang.lyra@gmail.com, gengcixi@gmail.com, orson.zhai@unisoc.com, Liangcai Fan <liangcai.fan@unisoc.com>

On Wed, Dec 25, 2019 at 2:58 PM Liangcai Fan <fanliangcai9@gmail.com> wrote:
>
> From: Liangcai Fan <liangcai.fan@unisoc.com>
>
> Use sh to run mkcompile_h, compilation would fail if whoami contains
> backslash, since sh uses dash. The reason is that the echo command would
> interpret backslash to escapes, so the LINUX_COMPILE_BY definition was
> incorrect.
>
> Parse mkcompile_h with bash, the echo command would not see backslash as
> escapes, then there is no error with the definition of LINUX_COMPILE_BY.
>
> Signed-off-by: Liangcai Fan <liangcai.fan@unisoc.com>
> Signed-off-by: Liangcai Fan <fanliangcai9@gmail.com>
> ---

This problem was fixed by
commit c8f3dea90e38194dae542c5d56e05d30447e58cb



-- 
Best Regards
Masahiro Yamada
