Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39001 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752184Ab1HSOHw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 19 Aug 2011 10:07:52 -0400
Message-ID: <4E4E6E37.6000809@suse.cz>
Date: Fri, 19 Aug 2011 16:07:51 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] kconfig/streamline_config.pl: directly access LSMOD
 from the environment
References: <1313472233-14094-1-git-send-email-lacombar@gmail.com> <1313508664.15704.28.camel@gandalf.stny.rr.com> <CACqU3MXuF8J7088XpfMu4gBeBgSKqrKLz-1pVKA295UidKfDNQ@mail.gmail.com> <1313525801.15704.29.camel@gandalf.stny.rr.com> <CACqU3MWTpwgjm0M0nRdkK0tAVQKrrtKv2Vh2GG71kKEVaWSWVQ@mail.gmail.com>
In-Reply-To: <CACqU3MWTpwgjm0M0nRdkK0tAVQKrrtKv2Vh2GG71kKEVaWSWVQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>

On 18.8.2011 01:48, Arnaud Lacombe wrote:
>>> If you ACK them, I think this would be better if they go through the
>>> kconfig tree. I have other patches pending touching
>>> `scripts/kconfig/Makefile' which might create conflicts.
>>
>> Fine with me. You can add my:
>>
>> Acked-by: Steven Rostedt <rostedt@goodmis.org>
>>
>> on all three patches.
>>
> If you want, you can directly pull the patches from the git repository at:
> 
>  git@github.com:lacombar/linux-2.6.git master/kconfig-localmodconfig

Pulled, thanks.

Michal
