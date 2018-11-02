Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42387 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbeKCHx6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Nov 2018 03:53:58 -0400
Date: Fri, 2 Nov 2018 23:44:51 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH] kconfig: merge_config: avoid false positive matches from
 comment lines
Message-ID: <20181102224450.GA11633@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <1541145151-7319-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541145151-7319-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nasser <afshin.nasser@gmail.com>, linux-kernel@vger.kernel.org

Hi Masahiro,

> The current SED_CONFIG_EXP could match to comment lines in config
> fragment files, especially when CONFIG_PREFIX_ is empty. For example,
> Buildroot uses empty prefixing; starting symbols with BR2_ is just
> convention.

> Make the sed expression more robust against false positives from
> comment lines. The new sed expression matches to config options
> followed by '=' or ' is not set'.

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

> -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
> +SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)\(=.*\| is not set$\)/\2/p"

Good idea, thanks!


Kind regards,
Petr
