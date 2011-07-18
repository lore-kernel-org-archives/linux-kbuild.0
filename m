Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:52136 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751171Ab1GRP06 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2011 11:26:58 -0400
Received: by ywe9 with SMTP id 9so1341430ywe.19
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Jul 2011 08:26:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110718142947.GA4482@sepie.suse.cz>
References: <1310671867-5107-1-git-send-email-lacombar@gmail.com>
	<20110718142947.GA4482@sepie.suse.cz>
Date: Mon, 18 Jul 2011 11:26:57 -0400
Message-ID: <CACqU3MXhTaWJm_9RZOXWSrRnigqRvuExHmWSTOeoroZN0TVh=g@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix missing "0x" prefix from S_HEX symbol in autoconf.h
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@xenotime.net>, Mauro Carvalho Chehab <mchehab@infradead.org>

Hi,

On Mon, Jul 18, 2011 at 10:29 AM, Michal Marek <mmarek@suse.cz> wrote:
> On Thu, Jul 14, 2011 at 03:31:07PM -0400, Arnaud Lacombe wrote:
>> The specialized printer for headers (espectially autoconf.h) is missing fixup
>> code for S_HEX symbol's "0x" prefix. As long as kconfig does not warn for such
>> missing prefix, this code is needed. Fix this.
>>
>> In the same time, fix some nits in `header_print_symbol()'.
>>
>> Cc: Randy Dunlap <rdunlap@xenotime.net>
>> Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
>>
>> Broken-by: Arnaud Lacombe <lacombar@gmail.com>
>> (Somehow-)Reported-by: Randy Dunlap <rdunlap@xenotime.net>
>> Reported-by: Mauro Carvalho Chehab <mchehab@infradead.org>
>> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>
> Thanks, applied kbuild-2.6.git#kconfig. It did actually compare the
> kconfig generated files after your previous patch, but I only compared
> defconfig and it didn't trigger this bug.
>
this is why kconfig _needs_ a regression testsuite, not to rely on any
existing configuration or syntax which may only be used in the corners
of dark architecture.  :-)

I'm more or less working on that.

 - Arnaud
