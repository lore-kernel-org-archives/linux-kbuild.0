Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49133 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405976AbfJXQ7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Oct 2019 12:59:17 -0400
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x9OGwwbf014422
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2019 01:58:59 +0900
Received: by mail-vk1-f173.google.com with SMTP id r85so1864306vke.3
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Oct 2019 09:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191023015426.31169-1-unixbhaskar@gmail.com>
In-Reply-To: <20191023015426.31169-1-unixbhaskar@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 25 Oct 2019 01:58:20 +0900
Message-ID: <CAK7LNARQ_XW9FGs0YkneR-4UomP=0Cj7D7cKpJCQ_EUYEkJ-gA@mail.gmail.com>
Subject: Re: [PATCH RESEND] scripts: setlocalversion: replace backquote to
 dollar parenthesis
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Oct 23, 2019 at 10:56 AM Bhaskar Chowdhury
<unixbhaskar@gmail.com> wrote:
>
> This patch replace backquote to dollar parenthesis syntax for better
> readability.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>      Acked-by: Randy Dunlap <rdunlap@infradead.org>
>      Acked-by: Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>
> ---

Applied to linux-kbuild. Thanks.





-- 
Best Regards
Masahiro Yamada
