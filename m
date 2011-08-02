Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43116 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754153Ab1HBTaq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 2 Aug 2011 15:30:46 -0400
Message-ID: <4E38510B.6090001@suse.cz>
Date: Tue, 02 Aug 2011 21:33:31 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: Introduce IS_ENABLED(), IS_BUILTIN() and	IS_MODULE()
References: <1311634718-32588-1-git-send-email-mmarek@suse.cz> <1311947497-4958-1-git-send-email-mmarek@suse.cz> <20110802173343.GA5251@merkur.ravnborg.org> <CACqU3MUy_EBaVB_VHW0EcbMcV9Qn_H=oh4ZKkCaUuPtbezpC4A@mail.gmail.com> <20110802192610.GA5338@merkur.ravnborg.org>
In-Reply-To: <20110802192610.GA5338@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, xiyou.wangcong@gmail.com, rdunlap@xenotime.net, linux-kernel@vger.kernel.org, plagnioj@jcrosoft.com

Dne 2.8.2011 21:26, Sam Ravnborg napsal(a):
>>>
>>> If we do it like this then how about adding this to autoconf.h and avoid the extra file,
>>> and the extra flag to gcc?
>>>
>> That would be intrusive for non-Linux users of kconfig. You would have
>> to hardcode a <linux/kconfig.h> in autoconf.h, which mean other
>> project would have to either mirror the Linux include tree structure,
>> or modify kconfig for the desired include path, if the feature is
>> desired at all. As I see it, Linux, through Kbuild, is a user of
>> kconfig.
> The idea was to entirely skip kconfig.h - and include the code in
> autoconf.h verbatim - so no extra file.

We could do that. I went for the extra file because it was easier to
edit a .h file than to edit a .c file that generates a .h file :).

Michal
