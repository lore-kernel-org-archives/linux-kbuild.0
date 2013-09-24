Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:58537 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753270Ab3IXMew (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Sep 2013 08:34:52 -0400
Received: by mail-lb0-f181.google.com with SMTP id u14so3709379lbd.40
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Sep 2013 05:34:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130924121939.GD12758@n2100.arm.linux.org.uk>
References: <504DFBBF.5010202@free-electrons.com> <1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
 <20120927082955.GR17667@game.jcrosoft.org> <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
 <52416F97.802@keymile.com> <20130924120152.GI11119@titan.lakedaemon.net> <20130924121939.GD12758@n2100.arm.linux.org.uk>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 24 Sep 2013 14:34:30 +0200
Message-ID: <CACQ1gAjNNszH3fOf-=RcuCQRrqu53i8ss40OrHQxd-Uah_ESZg@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jason Cooper <jason@lakedaemon.net>, Gerlando Falauto <gerlando.falauto@keymile.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

2013/9/24 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> Modern platforms
> should be using a DT compatible boot loader, which means you don't
> want to use the DTB appended to zImage method.

Even small bootloaders like at91bootstrap can handle DT blob now (that
was my main problem at the time I wrote this patch)
So I don't use it anymore. (but as a developer tool, this can be convenient).

Richard.
