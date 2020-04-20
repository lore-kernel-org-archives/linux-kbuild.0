Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726673AbgDTNxR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 09:53:17 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF893C061A10
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 06:53:16 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id b62so10550655qkf.6
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 06:53:16 -0700 (PDT)
Date: Mon, 20 Apr 2020 10:53:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [RFC PATCH 1/2] Kconfig: Introduce "uses" keyword
Message-ID: <20200420135313.GN26002@ziepe.ca>
References: <20200417011146.83973-1-saeedm@mellanox.com>
 <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQZd_LUyA2V_pCvMTr_201nSX1Nm0TDw5kOeNV64rOfpA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Saeed Mahameed <saeedm@mellanox.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, Jani Nikula <jani.nikula@linux.intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Leon Romanovsky <leon@kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, jonas@kwiboo.se, David Airlie <airlied@linux.ie>, jernej.skrabec@siol.net, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>, linux-rdma@vger.kernel.org

On Sun, Apr 19, 2020 at 04:00:43AM +0900, Masahiro Yamada wrote:

> People would wonder, "what 'uses FOO' means?",
> then they would find the explanation in kconfig-language.rst:
> 
>   "Equivalent to: depends on symbol || !symbol
>   Semantically it means, if FOO is enabled (y/m) and has the option:
>   uses BAR, make sure it can reach/use BAR when possible."
> 
> To understand this correctly, people must study
> the arithmetic of (symbol || !symbol) anyway.

I think people will just cargo-cult copy it and not think too hard
about how kconfig works.

The descriptions in kconfig-language.rst can be improved to better
guide C people using kconfig without entirely understanding
it. Something like:

 BAR depends on FOO // BAR selects FOO: BAR requires functionality from
 FOO

 BAR uses FOO: BAR optionally consumes functionality from FOO using
 IS_ENABLED

 BAR implies FOO: BAR optionally consumes functionality from FOO using
 IS_REACHABLE

Now someone adding IS_ENABLED or IS_REACHABLE checks to C code knows
exactly what to put in the kconfig.

Jason
