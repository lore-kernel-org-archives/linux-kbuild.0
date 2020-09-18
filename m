Return-Path: <SRS0=/tcE=C3=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D21C43463
	for <linux-kbuild@archiver.kernel.org>; Fri, 18 Sep 2020 22:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0207206A1
	for <linux-kbuild@archiver.kernel.org>; Fri, 18 Sep 2020 22:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgIRWXA (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 18 Sep 2020 18:23:00 -0400
Received: from smtprelay0190.hostedemail.com ([216.40.44.190]:34686 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726134AbgIRWW7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 18:22:59 -0400
X-Greylist: delayed 349 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Sep 2020 18:22:59 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave01.hostedemail.com (Postfix) with ESMTP id C3B711801BD7F
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 22:17:11 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id B478F180A9F5C;
        Fri, 18 Sep 2020 22:17:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: fuel96_17095382712e
X-Filterd-Recvd-Size: 1749
Received: from XPS-9350 (unknown [172.58.22.179])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Fri, 18 Sep 2020 22:17:07 +0000 (UTC)
Message-ID: <db060a64c2499fc497d50ee480696b1450c07125.camel@perches.com>
Subject: Re: [PATCH] MAINTAINERS: fix KERNEL_BUILD entry
From:   Joe Perches <joe@perches.com>
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>
Date:   Fri, 18 Sep 2020 15:17:05 -0700
In-Reply-To: <20200918220431.251873-1-pierre-louis.bossart@linux.intel.com>
References: <20200918220431.251873-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 2020-09-18 at 17:04 -0500, Pierre-Louis Bossart wrote:
> the get_maintainer.pl script throws the following errors:
> 
> Unmatched () '(open list:KERNEL BUILD + files below scripts/ (unless
> mai...)' '' at /usr/lib/git-core/git-send-email line 546.
> 
> error: unable to extract a valid address from:
> linux-kbuild@vger.kernel.org (open list:KERNEL BUILD + files below
> scripts/ (unless mai...)
> 
> Removing parentheses and adding dash separators makes this go away.

That's the git send-email program, not get_maintainer.pl.

btw: you should add --norolestats to get_maintainer.pl if and when
you use --to-cmd or --cc-cmd for git send-email.


