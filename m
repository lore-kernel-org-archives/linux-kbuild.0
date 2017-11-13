Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:53687 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752962AbdKMPZq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Nov 2017 10:25:46 -0500
MIME-Version: 1.0
In-Reply-To: <878tfftiit.fsf@turtle.gmx.de>
References: <878tfftiit.fsf@turtle.gmx.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 14 Nov 2017 00:25:00 +0900
Message-ID: <CAK7LNATSVtZDTOEsCNtvhn2ifjrz4-+5Okq7SYpPC_CDvhLA_g@mail.gmail.com>
Subject: Re: [PATCH] builddeb: Pass the kernel:debarch substvar to dpkg-genchanges
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sven Joachim <svenjoac@gmx.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2017-11-10 3:27 GMT+09:00 Sven Joachim <svenjoac@gmx.de>:
> At the end of "make bindeb-pkg" I noticed the following warning:
>
> dpkg-genchanges: warning: unknown substitution variable ${kernel:debarch}
>
> It turns out that since dpkg version 1.19.0 dpkg-genchanges honors
> substitution variables in the Description field, while earlier
> versions silently left them alone, see https://bugs.debian.org/856547.
>
> The result is an incomplete description of the linux-headers package
> in the generated .changes file.  Fix it by passing the kernel:debarch
> substitution variable to dpkg-genchanges.
>
> Signed-off-by: Sven Joachim <svenjoac@gmx.de>
> ---

Applied to linux-kbuild/misc.  Thanks!




-- 
Best Regards
Masahiro Yamada
