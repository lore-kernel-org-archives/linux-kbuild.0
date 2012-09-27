Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:63593 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754628Ab2I0JJB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Sep 2012 05:09:01 -0400
Received: by bkcjk13 with SMTP id jk13so1383456bkc.19
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Sep 2012 02:09:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120927082955.GR17667@game.jcrosoft.org>
References: <504DFBBF.5010202@free-electrons.com> <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
 <20120927082955.GR17667@game.jcrosoft.org>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Thu, 27 Sep 2012 11:08:39 +0200
Message-ID: <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Michal Marek <mmarek@suse.cz>, devicetree-discuss@lists.ozlabs.org, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, Gregory CLEMENT <gregory.clement@free-electrons.com>

2012/9/27 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>:
>> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>> Tested-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> as discuss with Grant no this is a temporary solution so no Makefile Target
>
> so nack

hum, it doesn't seems to be temporary on powerpc.
cf 25431333813686654907ab987fb5de10c10a16db
and
ARCH=powerpc make help

So what's the problem on arm ?
