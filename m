Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BCFC4338F
	for <linux-kbuild@archiver.kernel.org>; Sat, 21 Aug 2021 23:26:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBD7B6124E
	for <linux-kbuild@archiver.kernel.org>; Sat, 21 Aug 2021 23:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhHUX1S (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 21 Aug 2021 19:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhHUX1R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Aug 2021 19:27:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5CBC061575;
        Sat, 21 Aug 2021 16:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=Co5Y/EX5ifuICbWnNsfkQFUM3mlOJV+v5gGJyiXYvg0=; b=BZBEcBWop5OVJATFGiVuPVrIYh
        xQBQRi+IUePF65ReBcVy22F2sNzwlXy1Ei+ekmD32gk0V4kHMwGMyLmbT82wdG4RA7W2mMGJ8QC32
        hMzvTZyZyNU95YBJTj6z/aQjfrvjCaxWSk6rmAv1ubAu3gba645aQB9Y/Fsp4CmZtPZfYiY2vIQlu
        C9CJkxKlvpT5wGk5fW58ku+GyG/UjwYClm6MoT6QJ+jrz30MvadTjQFzCwG9Mqmxjrx8H0ZbHGzOH
        HYrv0pJpIBRu+32spOV8YCvvKUjCWv/ddaEACKRMhB2jU3P7IFxsg9Yb4U3K7Y8c8N1rBurueER5E
        500dVG/w==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mHaNi-00DJbv-QV; Sat, 21 Aug 2021 23:26:30 +0000
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <20210813224131.25803-1-rdunlap@infradead.org>
 <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
 <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3c16596b-8fa1-4f36-7f4c-16a8034c92e1@infradead.org>
Date:   Sat, 21 Aug 2021 16:26:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/16/21 5:33 PM, Linus Torvalds wrote:
> On Fri, Aug 13, 2021 at 2:01 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>>  From a quick google, it seems like '-Wmain' means something else for
>> clang. But it is probably ok.
> 
> So the warnings that clang gives with -Wmain seem to be much more reasonable.
> 
> Which makes me think that the '-Wno-main' thing would likely be better
> as a gcc-only thing.
> 
> Maybe something like this instead?
> 
>                Linus

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Should I resend the full patch?

Thanks.

-- 
~Randy

