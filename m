Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC266C43462
	for <linux-kbuild@archiver.kernel.org>; Wed, 12 May 2021 20:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE2DB613D3
	for <linux-kbuild@archiver.kernel.org>; Wed, 12 May 2021 20:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241457AbhELU6D (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 12 May 2021 16:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357291AbhELSiW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 14:38:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23BDC0613ED
        for <linux-kbuild@vger.kernel.org>; Wed, 12 May 2021 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=6FKec6k+Cdj5VkVqYIBj9oCBl3UX/p+YEHRDct9lCrU=; b=PvTnHP9GrPKMGqFFTNNWJkKh/S
        MB6z++AgQ0njQSiZTjVdTT3FlvcmyK81UHYVTpfm8d3mycZH+BjAqz7+yOemKesgfBbXmR8Dod1i7
        8aFfeFmEg6Af7BGMCtmcUEC9HPeqMdJfMLlMJrUHPo2gxUGfroec9hQO8wB4uoqUiAzU9VHNdl45y
        GaRuRxvtOXhsl2RgJy/f848aJ/UBoD3e5DKTKB7AqlDSlxiAWKTgkalq+c6cELQS0wJZo1AEFBCZk
        RFUHb3rBpO4BosOzxRYaJJx6Qb4oVF8V+JdaVebFlqsW+w6bFDuhVk2ezprPuQlKh1+4KXE4GYok4
        PzIHdCjQ==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lgtgq-00AiOK-P7; Wed, 12 May 2021 18:34:36 +0000
Subject: Re: arch/um/include/asm/Kbuild question
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        richard -rw- weinberger <richard.weinberger@gmail.com>
References: <2321702f-b888-87f6-b314-8e5734ee7fa9@infradead.org>
 <CAK7LNAR_-c+_9wc7wXo2Q7E_wEY+Mhg1XvxmDy7VHwVcEyBFeA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <39db71a0-e3ff-5aec-c359-1362261edee4@infradead.org>
Date:   Wed, 12 May 2021 11:34:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR_-c+_9wc7wXo2Q7E_wEY+Mhg1XvxmDy7VHwVcEyBFeA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/12/21 12:06 AM, Masahiro Yamada wrote:
> On Wed, May 12, 2021 at 3:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Hi.
>>
>> I thought that adding
>> +generic-y += rwonce.h
>>
>> to arch/um/include/asm/Kbuild would fix a build problem:
>>
>>   CC [M]  fs/hostfs/hostfs_user.o
>> In file included from ../include/asm-generic/div64.h:27,
>>                  from ../fs/hostfs/hostfs_user.c:21:
>> include/linux/compiler.h:248:10: fatal error: asm/rwonce.h: No such file or directory
>>   248 | #include <asm/rwonce.h>
>>       |          ^~~~~~~~~~~~~~
>>
>>
>> but it doesn't seem to be helping.
>> Do I need to use mandatory-y instead?
>>
>> Or is arch/um/ with ARCH=um and SUBARCH=i386 just "different"?
> 
> 
> I see
> 
>   mandatory-y += rwonce.h
> 
> in include/asm-generic/Kbuild.
> 
> 
> arch/x86/include/generated/asm/rwonce.h
> is generated.
> 
> 
> Is it still failing?

Yes, I see the generated/asm/rwonce.h file but it
still fails.

Thanks.

>>
>> The build error is:
>> ERROR: modpost: "__divdi3" [fs/hostfs/hostfs.ko] undefined!
>>
>> and my current patch attempt is below
>>
>> Thanks.
>>
>> ---

-- 
~Randy

