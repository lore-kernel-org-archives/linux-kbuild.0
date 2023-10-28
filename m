Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142C4C0032E
	for <linux-kbuild@archiver.kernel.org>; Sat, 28 Oct 2023 16:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjJ1QAt (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 28 Oct 2023 12:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ1QAs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Oct 2023 12:00:48 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C56E1;
        Sat, 28 Oct 2023 09:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=ff4n1jsCiEdyBssR3St9dKCeTqurWLxsez3pEHvyako=; b=NBHBAwGIrKasAi17RFhkFe54G6
        faZeZiL5C4UvS4Uzd1fynS6/5s3NR3tdz/zW3upxl8/4Lg00JSL7V/YOBU7FnxOI5S1h3Ta3gekEG
        YcW9111NEF3T6hL+YZ8KC/WKxjejDcbnv3ooamzrZOVsrCCatxhYG7B+l3hR9XmIzkPK88Ht48kbL
        9jQVPFacWZwslx68bUHddNJcDP7JJBLIm0J/RnnoClgN4ObcsSMKGdpnqOvIQ+E+pr/N/2kIJaeIT
        WsKS6RewPhu+vB+II0re8sGBYGyvYsao/4h3TobpoVDsCx9VVZj+SZAoqPfQAhBZRwkMcAcIlgHtb
        flcUkRug==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qwljo-000d0h-1O;
        Sat, 28 Oct 2023 16:00:36 +0000
Message-ID: <8fba0cd3-6666-4ea0-822b-006a457e0101@infradead.org>
Date:   Sat, 28 Oct 2023 09:00:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] kbuild: Correct missing architecture-specific hyphens
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Simon Glass <sjg@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231026072628.4115527-1-sjg@chromium.org>
 <20231026072628.4115527-2-sjg@chromium.org>
 <CAK7LNAReQB4KF_Ka=SUWSJ2psvqCrEm=BOkKXCYDK7Ux9uYutg@mail.gmail.com>
Content-Language: en-US
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAK7LNAReQB4KF_Ka=SUWSJ2psvqCrEm=BOkKXCYDK7Ux9uYutg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/28/23 02:50, Masahiro Yamada wrote:
> On Thu, Oct 26, 2023 at 4:27 PM Simon Glass <sjg@chromium.org> wrote:
>>
>> These should add a hyphen to indicate that it makes a adjective. Fix
>> them.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>> ---
> 
> 
> This is trivial.
> Applied to linux-kbuild. Thanks.
> 
> 
> git grep -i 'arch specific'
> 
>  or
> 
> git grep -i 'architecture specific'
> 
> finds similar patterns, but presumably we are not
> keen on fixing them tree-wide.

or '32 bit', '64 bit', but I agree with "not keen on
fixing them tree-wide."


-- 
~Randy
