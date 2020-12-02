Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0BDC64E7A
	for <linux-kbuild@archiver.kernel.org>; Wed,  2 Dec 2020 01:03:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D9562085B
	for <linux-kbuild@archiver.kernel.org>; Wed,  2 Dec 2020 01:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgLBBDL (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Tue, 1 Dec 2020 20:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgLBBDK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 20:03:10 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8390CC0613CF;
        Tue,  1 Dec 2020 17:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=CnZlcJ2NJuUYVP4Jp6vy9aksSEdE5MotOzqos0MteEY=; b=BUdr7GD8HsLc9m6HVRB4ATPMEz
        huoj+5e3VLs4OLQ6y5VaPfOkH/IKjbOcjUvpulwhKCzscn4JQ/MxqT+UmAZ9/bsAN5HnryoBiZ5z5
        k8IPITKsrzKc1j1ns0iHmcUy7V521OTsLMr+vsvOSSWPpEP0G/duan/w/0m4z6j4kE2sqr0ua6aOm
        tbGAws3jEE30zwM9bl+brGuF6ixG1yQSeiF/fjdT4qOXzJADA5beXveeqfUpNDjBEvlM4Xd11IlGJ
        LCsBPJOLiVYgmkzCA6TUgxwFH6fOB1zbG9tOTX8BnZKjz947gGkHuhNKV+G5MyA5cyK9A5Se/6HVm
        oBe29Kcg==;
Received: from [2601:1c0:6280:3f0::1494]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkGXF-0008Sb-3Y; Wed, 02 Dec 2020 01:02:28 +0000
Subject: Re: [PATCH] gconfig: avoid use of hard coded colors for rows
To:     Ebrahim Byagowi <ebrahim@gnu.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201123213314.GA25149@gnu.org> <20201123215143.GA21824@gnu.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <67b44d49-d23c-fab0-e165-cc84817562af@infradead.org>
Date:   Tue, 1 Dec 2020 17:02:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123215143.GA21824@gnu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/23/20 1:51 PM, Ebrahim Byagowi wrote:
> Not an important thing of course just that I was unable to
> use gconfig on my system with a theme dark is set like [1]
> and this turns it into [2] without noticable change to the
> light theme.
> 
> I had hit this minor issue also in the past but decided to
> fix it this time.
> 
> This isn't the best possible approach as now we have we have
> a GdkColor -> gchar * -> GdkColor round trip, yet wanted to
> keep the change small and maybe go for a larger change later
> if it worths it.
> 
> Hope you find it useful also.
> 
>   [1]: https://i.imgur.com/MJfIkup.png
>   [2]: https://i.imgur.com/lgvod9V.png

Hi,

AFAIK, this makes one known gconfig user.
I was hoping that we could remove it...


-- 
~Randy

