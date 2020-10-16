Return-Path: <SRS0=qdbG=DX=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46EEC433E7
	for <linux-kbuild@archiver.kernel.org>; Fri, 16 Oct 2020 14:12:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9048920874
	for <linux-kbuild@archiver.kernel.org>; Fri, 16 Oct 2020 14:12:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408650AbgJPOMz (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:12:55 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:59790 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404154AbgJPOMz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Oct 2020 10:12:55 -0400
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kTQTF-001zeb-BZ; Fri, 16 Oct 2020 16:12:37 +0200
Date:   Fri, 16 Oct 2020 16:12:37 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        netdev <netdev@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH net-next v2 1/2] Makefile.extrawarn: Add symbol for W=1
 warnings for today
Message-ID: <20201016141237.GD456889@lunn.ch>
References: <20201001011232.4050282-1-andrew@lunn.ch>
 <20201001011232.4050282-2-andrew@lunn.ch>
 <CAKwvOdnVC8F1=QT03W5Zh9pJdTxxNfRcqXeob5_b4CXycvG1+g@mail.gmail.com>
 <20201002014411.GG4067422@lunn.ch>
 <CAKwvOdmdfwWsRtJHtJ16B0RMyoxUi1587OKnyunQd5gfwmnGsA@mail.gmail.com>
 <20201005194913.GC56634@lunn.ch>
 <CAK8P3a1qS8kaXNqAtqMKpWGx05DHVHMYwKBD_j-Zs+DHbL5CNw@mail.gmail.com>
 <20201005210808.GE56634@lunn.ch>
 <CAK7LNASB6ashOzmL5XntkPSq9a+8VoWCowP5CAt+oX0o=0y=dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASB6ashOzmL5XntkPSq9a+8VoWCowP5CAt+oX0o=0y=dA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> One drawback of your approach is that
> you cannot set KBUILD_CFLAGS_W1_20200930
> until you eliminate all the warnings in the
> sub-directory in interest.
> (i.e. all or nothing approach)

Hi Mashiro

That actual works well for my use case. drivers/net/ethernet is W=1
clean. So is drivers/net/phy, drivers/net/mdio. Developers generally
clean up a subsystem by adding W=1 to the command line because that is
the simple tool they have.

And my aim here is to keep those subsystem W=1 clean. I don't care
about individual warnings within W=1, because those subsystems are
passed that stage already.

    Andrew
