Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54070 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeKERuk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 12:50:40 -0500
Received: by mail-wm1-f67.google.com with SMTP id v24-v6so7341223wmh.3
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Nov 2018 00:32:07 -0800 (PST)
Date: Mon, 5 Nov 2018 09:32:03 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH v2] kconfig: merge_config: avoid false positive matches
 from comment lines
Message-ID: <20181105083202.GB4485@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <1541405976-13747-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541405976-13747-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org

> The current SED_CONFIG_EXP could match to comment lines in config
> fragment files, especially when CONFIG_PREFIX_ is empty. For example,
> Buildroot uses empty prefixing; starting symbols with BR2_ is just
> convention.

> Make the sed expression more robust against false positives from
> comment lines. The new sed expression matches to only valid patterns.

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> ---
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

> Changes in v2:
>   - Another (more precise) implementation approach
>     based on the option from Arnout Vandecappelle.
>     This is still easier to read, but adds a bit duplication.

>  scripts/kconfig/merge_config.sh | 7 ++++---
...
> -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
> +SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
> +SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
...
> -	CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
> +	CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
...
> -for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
> +for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do

Kind regards,
Petr
