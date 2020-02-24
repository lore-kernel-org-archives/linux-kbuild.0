Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43955 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBXWw4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 17:52:56 -0500
Date: Mon, 24 Feb 2020 16:52:53 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] kbuild: fix DT binding schema rule to detect command
 line changes
Message-ID: <20200224225253.GA27948@bogus>
References: <20200222190435.11767-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200222190435.11767-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Sun, Feb 23, 2020 at 04:04:31AM +0900, Masahiro Yamada wrote:
> This if_change_rule is not working; it cannot detect any command line
> changes.
> 
> The reason is because cmd-check in scripts/Kbuild.include compares
> $(cmd_$@) and $(cmd_$1), but cmd_dtc_dt_yaml does not exist here.
> 
> For if_change_rule to work properly, the stem part of cmd_* and rule_*
> must match. Because this cmd_and_fixdep invokes cmd_dtc, this rule must
> be named rule_dtc.
> 
> Fixes: 4f0e3a57d6eb ("kbuild: Add support for DT binding schema checks")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

For the series,

Acked-by: Rob Herring <robh@kernel.org>

I'm assuming you will take these? If not, I can in the DT tree.

Rob
