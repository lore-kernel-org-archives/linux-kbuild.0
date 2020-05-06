Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729477AbgEFWKV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 18:10:21 -0400
Subject: Re: Proper use for linking foo.o_shipped after 69ea912fda74 ("kbuild:
 remove unneeded link_multi_deps")?
References: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
 <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com>
 <01279bfe-95a3-dbdb-3785-bd2d92dc4f95@gmail.com>
 <CAK7LNASKHb5QzD-5d7Vam9t4C1U64_2tTk7eVAmK2oDVquy0MA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <365fcf52-8132-24eb-80d0-bb212a3534f1@gmail.com>
Date: Wed, 6 May 2020 15:10:17 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNASKHb5QzD-5d7Vam9t4C1U64_2tTk7eVAmK2oDVquy0MA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>



On 5/6/2020 9:24 AM, Masahiro Yamada wrote:
>> To me this is a regression, as it used to work and now it does not, thus
>> we should be fixing it, any idea about how we go about it without doing
>> a plain revert?
> 
> 
> In fact, a patch exists.
> 
> https://patchwork.kernel.org/patch/11318691/
> 
> It allows you to link whatever file name to a module,
> but please read the comments from Christoph and Greg.
> 
> 
> In this case, your Makefile is doing strange.
> 
> I'd recommend to fix your Makefile.

Yes, I ended up finding a way to fix it, thank you for your time.
-- 
Florian
