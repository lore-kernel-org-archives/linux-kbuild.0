Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DD1C433E6
	for <linux-kbuild@archiver.kernel.org>; Wed, 27 Jan 2021 06:35:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A04072071C
	for <linux-kbuild@archiver.kernel.org>; Wed, 27 Jan 2021 06:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbhA0GdW (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 27 Jan 2021 01:33:22 -0500
Received: from smtprelay0209.hostedemail.com ([216.40.44.209]:48334 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233742AbhA0DMJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 22:12:09 -0500
X-Greylist: delayed 525 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Jan 2021 22:12:09 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 9C8041803738F
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jan 2021 03:05:08 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id BDA5318224D68;
        Wed, 27 Jan 2021 03:02:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: arch06_0e14db527593
X-Filterd-Recvd-Size: 1821
Received: from [192.168.1.159] (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Wed, 27 Jan 2021 03:02:22 +0000 (UTC)
Message-ID: <c973355e545bcdc52b619f2d13bfa41915074307.camel@perches.com>
Subject: Re: [PATCH] Revert "checkpatch: add check for keyword 'boolean' in
 Kconfig definitions"
From:   Joe Perches <joe@perches.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Christoph Jaeger <cj@linux.com>,
        Andy Whitcroft <apw@canonical.com>,
        linux-kernel@vger.kernel.org
Date:   Tue, 26 Jan 2021 19:02:20 -0800
In-Reply-To: <20210126191541.210168-1-masahiroy@kernel.org>
References: <20210126191541.210168-1-masahiroy@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2021-01-27 at 04:15 +0900, Masahiro Yamada wrote:
> This reverts commit 327953e9af6c59ad111b28359e59e3ec0cbd71b6.
> 
> You cannot use 'boolean' since commit b92d804a5179 ("kconfig: drop
> 'boolean' keyword").
> 
> This check is no longer needed.

Thanks.

> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Joe Perches <joe@perches.com>

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -3390,13 +3390,6 @@ sub process {
>  			}
>  		}
>  
> -# discourage the use of boolean for type definition attributes of Kconfig options
> -		if ($realfile =~ /Kconfig/ &&
> -		    $line =~ /^\+\s*\bboolean\b/) {
> -			WARN("CONFIG_TYPE_BOOLEAN",
> -			     "Use of boolean is deprecated, please use bool instead.\n" . $herecurr);
> -		}
> -
>  		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
>  		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
>  			my $flag = $1;


