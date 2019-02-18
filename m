Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gateway23.websitewelcome.com ([192.185.50.107]:32471 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726009AbfBRSkb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 13:40:31 -0500
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 89EB6C5AA
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Feb 2019 11:50:04 -0600 (CST)
References: <20180524225928.GA19570@embeddedor.com>
 <20180613114059.DAC95601D2@smtp.codeaurora.org>
 <87zhqwuggt.fsf_-_@kamboji.qca.qualcomm.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: -Wimplicit-fallthrough not working with ccache
Message-ID: <18320143-188a-8940-1830-1955e279952a@embeddedor.com>
Date: Mon, 18 Feb 2019 11:49:59 -0600
MIME-Version: 1.0
In-Reply-To: <87zhqwuggt.fsf_-_@kamboji.qca.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, linux-kbuild@vger.kernel.org, Kees Cook <keescook@chromium.org>

Hi Kalle,

On 2/16/19 5:21 AM, Kalle Valo wrote:
> (replying to an old thread but renaming it)
> 
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
>> "Gustavo A. R. Silva" <gustavo@embeddedor.com> wrote:
>>
>>> In preparation to enabling -Wimplicit-fallthrough, mark switch cases
>>> where we are expecting to fall through.
>>>
>>> Notice that in this particular case, I replaced "pass through" with
>>> a proper "fall through" comment, which is what GCC is expecting
>>> to find.
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>>
>> Patch applied to ath-next branch of ath.git, thanks.
>>
>> f1d270ae10ff ath10k: htt_tx: mark expected switch fall-throughs
> 
> Gustavo, I enabled W=1 on my ath10k build checks and it took me a while
> to figure out why GCC was warning about fall through annotations missing
> even I knew you had fixed them. Finally I figured out that the reason
> was ccache, which I need because I work with different branches and need
> to recompile the kernel quite often.
> 
> If the plan is to enable -Wimplicit-fallthrough by default in the kernel
> IMHO this might become an issue, as otherwise people using ccache start
> seeing lots of invalid warnings. Apparently CCACHE_COMMENTS=1 will fix
> that but my version of ccache doesn't support it, and how would everyone
> learn that trick anyway? Or maybe CCACHE_COMMENTS can enabled through
> kernel Makefile?
> 

Can you share with me the warning messages you get?

I just see the following warnings with linux-next:

$ make CC="ccache gcc" W=1 drivers/net/wireless/ath/ath10k/htt_tx.o
  CC [M]  drivers/net/wireless/ath/ath10k/htt_tx.o
In file included from drivers/net/wireless/ath/ath10k/htt_tx.c:19:
drivers/net/wireless/ath/ath10k/htt.h:1727:1: warning: alignment 1 of ‘struct ath10k_htt_txbuf_32’ is less than 4 [-Wpacked-not-aligned]
 } __packed;
 ^
drivers/net/wireless/ath/ath10k/htt.h:1734:1: warning: alignment 1 of ‘struct ath10k_htt_txbuf_64’ is less than 4 [-Wpacked-not-aligned]
 } __packed;
 ^

In my Makefile I have:

KBUILD_CFLAGS  += $(call cc-option,-Wimplicit-fallthrough=3,)


Thanks
--
Gustavo
