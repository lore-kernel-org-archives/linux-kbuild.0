Return-Path: <SRS0=vLoD=DM=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3676AC4363A
	for <linux-kbuild@archiver.kernel.org>; Mon,  5 Oct 2020 21:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0021C2078E
	for <linux-kbuild@archiver.kernel.org>; Mon,  5 Oct 2020 21:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgJEVIR (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 5 Oct 2020 17:08:17 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:44866 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbgJEVIR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Oct 2020 17:08:17 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kPXiK-000H6F-Se; Mon, 05 Oct 2020 23:08:08 +0200
Date:   Mon, 5 Oct 2020 23:08:08 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        netdev <netdev@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH net-next v2 1/2] Makefile.extrawarn: Add symbol for W=1
 warnings for today
Message-ID: <20201005210808.GE56634@lunn.ch>
References: <20201001011232.4050282-1-andrew@lunn.ch>
 <20201001011232.4050282-2-andrew@lunn.ch>
 <CAKwvOdnVC8F1=QT03W5Zh9pJdTxxNfRcqXeob5_b4CXycvG1+g@mail.gmail.com>
 <20201002014411.GG4067422@lunn.ch>
 <CAKwvOdmdfwWsRtJHtJ16B0RMyoxUi1587OKnyunQd5gfwmnGsA@mail.gmail.com>
 <20201005194913.GC56634@lunn.ch>
 <CAK8P3a1qS8kaXNqAtqMKpWGx05DHVHMYwKBD_j-Zs+DHbL5CNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a1qS8kaXNqAtqMKpWGx05DHVHMYwKBD_j-Zs+DHbL5CNw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> It depends a lot on what portion of the kernel gets enabled for W=1.
> 
> As long as it's only drivers that are actively maintained, and they
> make up a fairly small portion of all code, it should not be a problem
> to find someone to fix useful warnings.

Well, drivers/net/ethernet is around 1.5M LOC. The tree as a whole is
just short of 23M LOC. So i guess that is a small portion of all the
code.

	Andrew
