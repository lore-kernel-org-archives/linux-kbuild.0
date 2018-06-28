Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:45092 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753194AbeF1EhU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jun 2018 00:37:20 -0400
Date: Thu, 28 Jun 2018 13:37:13 +0900 (KST)
Message-Id: <20180628.133713.1992787052157529632.davem@davemloft.net>
Subject: Re: [RESEND PATCH] bpfilter: check compiler capability in Kconfig
From: David Miller <davem@davemloft.net>
In-Reply-To: <1529985336-27522-1-git-send-email-yamada.masahiro@socionext.com>
References: <1529985336-27522-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: netdev@vger.kernel.org, alexei.starovoitov@gmail.com, mcroce@redhat.com, arnd@arndb.de, linux-kbuild@vger.kernel.org, ast@kernel.org, linux-kernel@vger.kernel.org, michal.lkml@markovi.net, daniel@iogearbox.net

From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 26 Jun 2018 12:55:35 +0900

> With the brand-new syntax extension of Kconfig, we can directly
> check the compiler capability in the configuration phase.
> 
> If the cc-can-link.sh fails, the BPFILTER_UMH is automatically
> hidden by the dependency.
> 
> I also deleted 'default n', which is no-op.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied, thank you.
