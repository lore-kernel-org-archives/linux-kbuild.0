Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www62.your-server.de ([213.133.104.62]:47527 "EHLO
        www62.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964777AbeFZK3y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jun 2018 06:29:54 -0400
Subject: Re: [RESEND PATCH] bpfilter: check compiler capability in Kconfig
References: <1529985336-27522-1-git-send-email-yamada.masahiro@socionext.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <23c880a2-8c93-567a-553f-a3438505e223@iogearbox.net>
Date: Tue, 26 Jun 2018 12:29:49 +0200
MIME-Version: 1.0
In-Reply-To: <1529985336-27522-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Matteo Croce <mcroce@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>

On 06/26/2018 05:55 AM, Masahiro Yamada wrote:
> With the brand-new syntax extension of Kconfig, we can directly
> check the compiler capability in the configuration phase.
> 
> If the cc-can-link.sh fails, the BPFILTER_UMH is automatically
> hidden by the dependency.
> 
> I also deleted 'default n', which is no-op.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
