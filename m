Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:45152 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfBPLVN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Feb 2019 06:21:13 -0500
From: Kalle Valo <kvalo@codeaurora.org>
Subject: -Wimplicit-fallthrough not working with ccache
References: <20180524225928.GA19570@embeddedor.com>
        <20180613114059.DAC95601D2@smtp.codeaurora.org>
Date: Sat, 16 Feb 2019 13:21:06 +0200
In-Reply-To: <20180613114059.DAC95601D2@smtp.codeaurora.org> (Kalle Valo's
        message of "Wed, 13 Jun 2018 11:40:59 +0000 (UTC)")
Message-ID: <87zhqwuggt.fsf_-_@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, linux-kbuild@vger.kernel.org

(replying to an old thread but renaming it)

Kalle Valo <kvalo@codeaurora.org> writes:

> "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
>
>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>> where we are expecting to fall through.
>> 
>> Notice that in this particular case, I replaced "pass through" with
>> a proper "fall through" comment, which is what GCC is expecting
>> to find.
>> 
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>
> Patch applied to ath-next branch of ath.git, thanks.
>
> f1d270ae10ff ath10k: htt_tx: mark expected switch fall-throughs

Gustavo, I enabled W=1 on my ath10k build checks and it took me a while
to figure out why GCC was warning about fall through annotations missing
even I knew you had fixed them. Finally I figured out that the reason
was ccache, which I need because I work with different branches and need
to recompile the kernel quite often.

If the plan is to enable -Wimplicit-fallthrough by default in the kernel
IMHO this might become an issue, as otherwise people using ccache start
seeing lots of invalid warnings. Apparently CCACHE_COMMENTS=1 will fix
that but my version of ccache doesn't support it, and how would everyone
learn that trick anyway? Or maybe CCACHE_COMMENTS can enabled through
kernel Makefile?

-- 
Kalle Valo
