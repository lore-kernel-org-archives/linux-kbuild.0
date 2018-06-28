Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:44964 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752257AbeF1CFY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jun 2018 22:05:24 -0400
Date: Wed, 27 Jun 2018 19:05:21 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [RESEND PATCH] bpfilter: check compiler capability in Kconfig
Message-ID: <20180628020519.txhrgq627cnhqspe@ast-mbp.dhcp.thefacebook.com>
References: <1529985336-27522-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529985336-27522-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Matteo Croce <mcroce@redhat.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Daniel Borkmann <daniel@iogearbox.net>

On Tue, Jun 26, 2018 at 12:55:35PM +0900, Masahiro Yamada wrote:
> With the brand-new syntax extension of Kconfig, we can directly
> check the compiler capability in the configuration phase.
> 
> If the cc-can-link.sh fails, the BPFILTER_UMH is automatically
> hidden by the dependency.
> 
> I also deleted 'default n', which is no-op.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I haven't tested it yet, but looks good to me as well.
Thank you for the follow up.
Acked-by: Alexei Starovoitov <ast@kernel.org>

