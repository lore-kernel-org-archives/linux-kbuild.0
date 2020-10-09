Return-Path: <SRS0=9QnV=DQ=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A281C433E7
	for <linux-kbuild@archiver.kernel.org>; Fri,  9 Oct 2020 00:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79CAD22253
	for <linux-kbuild@archiver.kernel.org>; Fri,  9 Oct 2020 00:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eaDC8Yd7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgJIAJ2 (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 8 Oct 2020 20:09:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgJIAJ1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Oct 2020 20:09:27 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95419C0613D2
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2020 17:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=4sXecF8r5E3WCmY0rts+z9kjTXQrZiIXc+J/I8uctk0=; b=eaDC8Yd7S8FVOHiuJkjm7Pa+nE
        r08483eQjNVcEmLvR0gNJsaqJz3sAhFvWE1wlHU6HLsu0J2rb6lU2C8EXDHIQ9ZrCnRMm2AQ8RaU/
        O8NxqeCu0Fd1jQc9x4PC2Oyuw4lOLYHX6w1mQHp0f920SYLcHt0fQEdTk005wXXPvzebnboTb5NDz
        hQoEXdXdP741xAhEJ82GgDnZJd0HtBLVrZy5UW+s1bjqAzgvZPPiE4W44SzgDCPw+UPO4CiXPkZUX
        uoVuUzAETNi5CCfL9BjV1On8V8BteExG9f+2oBs3AwdnQYK3uF1MtrqnBjRhAEBjN2fBQ60hN6NlT
        JWs7yRnA==;
Received: from [2601:1c0:6280:3f0::2c9a]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kQfyN-0000IP-3f; Fri, 09 Oct 2020 00:09:23 +0000
Subject: Re: [RFC PATCH] scripts: remove namespace.pl
To:     Jacob Keller <jacob.e.keller@intel.com>,
        linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jakub Kicinski <kuba@kernel.org>
References: <20201008232559.2866491-1-jacob.e.keller@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0bff6c13-bcf1-4854-dc12-826979f24ed5@infradead.org>
Date:   Thu, 8 Oct 2020 17:09:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008232559.2866491-1-jacob.e.keller@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/8/20 4:25 PM, Jacob Keller wrote:

[snip]

 
> However, given the discussion at [2], I suspect that few people are
> actively using this tool. It doesn't have a maintainer in the
> MAINTAINERS flie, and it produces so many warnings for unused symbols
> that it is difficult to use effectively. Thus, I propose we simply
> remove it.

Agreed. I don't see any evidence that anyone is using it.
Goodbye.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> [1] https://lore.kernel.org/netdev/20200708164812.384ae8ea@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
> [2] https://lore.kernel.org/lkml/20190129204319.15238-1-jacob.e.keller@intel.com/
> [3] https://lore.kernel.org/netdev/20190828.154744.2058157956381129672.davem@davemloft.net/
> [4] https://lore.kernel.org/netdev/20190827210928.576c5fef@cakuba.netronome.com/
> 
> Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jakub Kicinski <kuba@kernel.org>
> ---
>  Documentation/process/submit-checklist.rst |   3 +-
>  Makefile                                   |   6 +-
>  scripts/namespace.pl                       | 473 ---------------------
>  3 files changed, 2 insertions(+), 480 deletions(-)
>  delete mode 100755 scripts/namespace.pl


-- 
~Randy
