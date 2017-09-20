Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61575 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751499AbdITPzM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Sep 2017 11:55:12 -0400
MIME-Version: 1.0
In-Reply-To: <1505726539-30725-1-git-send-email-yamada.masahiro@socionext.com>
References: <1505726539-30725-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 21 Sep 2017 00:54:14 +0900
Message-ID: <CAK7LNAQjAQgH3+N4TJ9O2xV=R9SfDLDPKsGHVAg7X=9re=R1eg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deb-pkg: remove firmware package support
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Trippelsdorf <markus@trippelsdorf.de>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-09-18 18:22 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Commit 5620a0d1aacd ("firmware: delete in-kernel firmware") deleted
> in-kernel firmware support, including the firmware install command.
>
> So, the firmware package does not make sense any more.  Remove it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>

Applied to linux-kbuild/fixes.

-- 
Best Regards
Masahiro Yamada
