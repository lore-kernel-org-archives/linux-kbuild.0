Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D001FC43460
	for <linux-kbuild@archiver.kernel.org>; Thu, 29 Apr 2021 11:14:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ED3A6144E
	for <linux-kbuild@archiver.kernel.org>; Thu, 29 Apr 2021 11:14:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbhD2LP2 (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 29 Apr 2021 07:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhD2LP0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 07:15:26 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D1CCC06138B;
        Thu, 29 Apr 2021 04:14:40 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e5so37830969wrg.7;
        Thu, 29 Apr 2021 04:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=5/8VNkQOcNtPRtDrHmo/JB8UiRS4tDp43Rh0Drba7XA=;
        b=hKLM/5ShBvsG3gq3hjRH3gdwJMGrGMg3rv0LenlO0dHqNMXypdek0/BvF6QkqucTWp
         Gnv4NduO2YYNpTsFCfoy8r5NxddLs46wPPqZDnagTb2u0/7EwGzcP6pnntqmPtCNqs3o
         ZSF+i4y0yoEbzs4ejoCnKuYzcpU4UMmdIRxg7YwrM1fVpwsJTQ/eO1P/F5E8COUk2QZF
         w1Y5L851T+E+0DCZfMSLCPzGjN8EF5/VvxRo13IUQx4s51wBg9HOpgofk2p6URwRxgzY
         mNTswhKpHPT8mVorr3toSe7D8oolb0/yLALucqnitwOjcfPQOYorsRois6qusXDoV6Hy
         7UeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=5/8VNkQOcNtPRtDrHmo/JB8UiRS4tDp43Rh0Drba7XA=;
        b=NlupXyBnuC/TpCLu2ZZjJesF+hsuryczpUEIJkgmx74VryOlFipRk+Vx0pA5UQvzxV
         5OmWE4pcqlZZ9sJTQIllSHgb87Srj67DsUHAkLcoIFbJ9oozkjX0UG9vXrOvKvsVC+j+
         cibeP98jFHGQm280bwbHzdo+PwmwF4NOcYFspTwWhWjtvCYYRv2XKRzcUqHi7et8tOuY
         x2e2487pX2hMjiTvpgFY/eo5pHHB9AAQTd27cNlSedEZ4FSt7ZQ6A36Ew6dcryNaWuBg
         CgW6AmWsmbPN29g6NXVLD6UqBZEcrMsWZjpvVExe5nMF7afBRN0TQtKSW4pr42x0g8Bw
         5N7w==
X-Gm-Message-State: AOAM533Lkw9THqvEjB0t36Md9jBbXQQoUSjHrQRebJ+J3No/EtKyt2da
        HqPRafYzhobQ1R2Vbbcogv2iSjZFdR0=
X-Google-Smtp-Source: ABdhPJx+OnuJxzoAcODQiSKczbARoDqeij+9ia6FY9Qx9koqZbwr7/Rk2M2vPbAQyqYK7IyfOwabmw==
X-Received: by 2002:adf:e2cc:: with SMTP id d12mr42542589wrj.90.1619694878793;
        Thu, 29 Apr 2021 04:14:38 -0700 (PDT)
Received: from EDI-InfinityBook ([2a01:4b00:ea36:6c00:56e9:4ef3:28ef:7ef6])
        by smtp.gmail.com with ESMTPSA id p10sm4240810wrr.58.2021.04.29.04.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 04:14:38 -0700 (PDT)
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAJTyqKP4Ud7aWxdCihfzeZ3dQe_5yeTAVnXcKDonciez-g2zWA@mail.gmail.com>
 <acce51322e1249f888e7d2815228e7af@AcuMS.aculab.com>
User-agent: mu4e 1.4.15; emacs 28.0.50
From:   Kajetan Puchalski <mrkajetanp@gmail.com>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     "'mceier+kernel@gmail.com'" <mceier+kernel@gmail.com>,
        "ojeda@kernel.org" <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
In-reply-to: <acce51322e1249f888e7d2815228e7af@AcuMS.aculab.com>
Message-ID: <87czude41d.fsf@gmail.com>
Date:   Thu, 29 Apr 2021 12:14:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


David Laight <David.Laight@ACULAB.COM> writes:

> From: Mariusz Ceier
>> Sent: 28 April 2021 19:34
> ....
>>
>> I suggest to wait until featureful GPL implementation of rust 
>> language
>> is made (assuming GNU Rust is on the way) before merging any 
>> rust code
>> in the kernel and when that implementation is done make a 
>> requirement
>> that all rust code must be buildable by at least GPL 
>> implementation.
>>
>> Maybe it would also be worthwhile to make the requirement that 
>> the
>> kernel must be buildable with free software (not just open 
>> source
>> software) explicit ?
>
> Or put the version of the compiler that works in the source tree
> with the kernel and then build it as part of the full build.

Building compilers takes several hours, I'm pretty sure usually 
much more
than the kernel itself. Building the compiler as part of the full 
build
would be a gigantic pain for everyone involved. Rustc is even 
worse than
most compilers on that front due to the complexity of its runtime 
checks.

--
Kind regards,
Kajetan
