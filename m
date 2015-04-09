Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:25669 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754148AbbDIBne (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 21:43:34 -0400
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com [209.85.212.181]) (authenticated)
	by conssluserg002-v.nifty.com with ESMTP id t391hNJx025261
	for <linux-kbuild@vger.kernel.org>; Thu, 9 Apr 2015 10:43:24 +0900
Received: by wiaa2 with SMTP id a2so80003007wia.0
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Apr 2015 18:43:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1428493376-20197-1-git-send-email-mmarek@suse.cz>
References: <1428493376-20197-1-git-send-email-mmarek@suse.cz>
Date: Thu, 9 Apr 2015 10:43:22 +0900
Message-ID: <CAK7LNASDx7uqnT99PcWzfo2V=QTy=g5-VLQEB7aDmS+xSw+zqQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Simplify Makefile
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Michal,


2015-04-08 20:42 GMT+09:00 Michal Marek <mmarek@suse.cz>:
> Use a single rule for targets handled directly by the conf program.
>
> Signed-off-by: Michal Marek <mmarek@suse.cz>

Nice cleanup!

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
