Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vulcan.kevinlocke.name ([107.191.43.88]:34550 "EHLO
        vulcan.kevinlocke.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751199AbeFIFZL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Jun 2018 01:25:11 -0400
Date: Fri, 8 Jun 2018 23:25:08 -0600
From: Kevin Locke <kevin@kevinlocke.name>
Subject: Re: [PATCH] kconfig: fix localmodconfig
Message-ID: <20180609052508.GA10667@kevinolos>
References: <20180608215338.GA28473@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180608215338.GA28473@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrei Vagin <avagin@virtuozzo.com>

On Fri, 2018-06-08 at 23:53 +0200, Sam Ravnborg wrote:
> When kconfig syntax moved to use $(FOO) for environment variables
> localmodconfig was not updated.
> Fix so it now works with the new syntax $(FOO)
> 
> Fixes: 104daea149c45cc84842ce77a9bd6436d19f3dd8 ("kconfig: reference environment variables directly and remove 'option env='")

I can confirm `make localmodconfig` from 104daea149c4 with this patch
applied creates the same .config as it did in 104daea149c4^ and that
it creates a plausible .config (which I haven't built/tested yet) when
applied to master.

Works for me.  Thanks for the very fast fix!

Tested-by: Kevin Locke <kevin@kevinlocke.name>

Cheers,
Kevin
