Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20424 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754966AbdCTN4g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 09:56:36 -0400
MIME-Version: 1.0
In-Reply-To: <5dd95503-9782-6c9a-a6ac-6067eed1935e@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com> <20161122213434.14788-6-mmarek@suse.com>
 <CAAqcGHmnGFgCjmsjerecy2Jf0YaCThGp5TxS1yNXqGzZnsXLBQ@mail.gmail.com> <5dd95503-9782-6c9a-a6ac-6067eed1935e@suse.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 20 Mar 2017 22:56:00 +0900
Message-ID: <CAK7LNASLDTBj6FKx-zuGmWnwh2R=ZxWkT3aahPLREMnZ=eR6fw@mail.gmail.com>
Subject: Re: [PATCH 6/6] deb-pkg: Remove the KBUILD_IMAGE workaround
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Riku Voipio <riku.voipio@linaro.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2016-11-25 23:22 GMT+09:00 Michal Marek <mmarek@suse.com>:
> Dne 25.11.2016 v 13:12 Riku Voipio napsal(a):
>> On 22 November 2016 at 23:34, Michal Marek <mmarek@suse.com> wrote:
>>> The arch Makefile are fixed to set KBUILD_IMAGE to the full patch, so
>>> the workaround is no longer needed.
>>>
>>> Signed-off-by: Michal Marek <mmarek@suse.com>
>>> ---
>> Thanks for cleaning this up.
>>
>> Reviewed-by: Riku Voipio <riku.voipio@linaro.org>
>
> Note that this will only be merged once the individual arch patches have
> been picked up.
>



Applied to linux-kbuild/misc.  Thanks!


-- 
Best Regards
Masahiro Yamada
