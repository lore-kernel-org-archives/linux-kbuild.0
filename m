Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8E9C433EF
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 May 2022 20:44:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbiEWUox (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 23 May 2022 16:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231827AbiEWUow (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 May 2022 16:44:52 -0400
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr [80.12.242.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DB5DC805
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2022 13:44:51 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.180.246])
        by smtp.orange.fr with ESMTPA
        id tEv2namqfL5fDtEv2nb2b1; Mon, 23 May 2022 22:44:49 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 23 May 2022 22:44:49 +0200
X-ME-IP: 86.243.180.246
Message-ID: <002f1094-3232-75c0-44e8-1ea77749cc2e@wanadoo.fr>
Date:   Mon, 23 May 2022 22:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH] kbuild: Add an option to enable -O1 and speed-up
 compilation time
Content-Language: en-GB
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Dan <dan.carpenter@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
 <CANiq72=GZs5CmAMGAMaHrp1yJ8b7nv3HrsWNeQ42kfy0z5uuAg@mail.gmail.com>
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CANiq72=GZs5CmAMGAMaHrp1yJ8b7nv3HrsWNeQ42kfy0z5uuAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Le 23/05/2022 à 22:25, Miguel Ojeda a écrit :
> Hi Christophe,
> 
> On Mon, May 23, 2022 at 9:11 AM Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> wrote:
>>
>> +KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 1
> 
> The patch seems based on linux-next -- is this intended? Thanks!

Yes, I work on -next.

Honestly, this "RUST flag" was just a mimic of the KBUILD_CFLAGS.
No real opinion on it, I just put something that looked consistent for a 
patch that was only a RFC.

CJ

> 
> Cheers,
> Miguel
> 

