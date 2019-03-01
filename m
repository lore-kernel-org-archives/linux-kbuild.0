Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46865 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfCANeN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Mar 2019 08:34:13 -0500
Date: Fri, 1 Mar 2019 14:34:08 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH] scripts/package/Makefile: put proper config in source
 tarball
Message-ID: <20190301133407.GB20771@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20190221215901.23970-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190221215901.23970-1-ar@cs.msu.ru>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arseny Maslennikov <ar@cs.msu.ru>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Riku Voipio <riku.voipio@linaro.org>

Hi,

> It is widely known that one can build a kernel without a .config in the
> source tree by setting KCONFIG_CONFIG equal to the actual configuration
> file path.

> When making a *-pkg target, make(1) prepares a source tarball and tries
> to pack `.config' in there regardless of the value of KCONFIG_CONFIG,
> failing spectacularly if .config is absent and packing the wrong config
> if it exists.
> Let's fix that.

> Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
Reviewed-by: Petr Vorel <pvorel@suse.cz>


Kind regards,
Petr
