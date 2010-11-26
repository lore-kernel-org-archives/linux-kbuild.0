Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:50681 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754068Ab0KZKbS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Nov 2010 05:31:18 -0500
Message-ID: <4CEF8C74.8010600@suse.cz>
Date: Fri, 26 Nov 2010 11:31:16 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] kconfig: add an option to determine a menu's visibility
References: <4CD300AC.3010708@redhat.com>	<1289079027-3037-2-git-send-email-lacombar@gmail.com> <AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
In-Reply-To: <AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>

On 25.11.2010 18:06, Arnaud Lacombe wrote:
> Hi folks,
> 
> On Sat, Nov 6, 2010 at 5:30 PM, Arnaud Lacombe <lacombar@gmail.com> wrote:
>> This option is aimed to add the possibility to control a menu's visibility
>> without adding dependency to the expression to all the submenu.
>>
>> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>> ---
>>  scripts/kconfig/expr.h      |    1 +
>>  scripts/kconfig/lkc.h       |    1 +
>>  scripts/kconfig/menu.c      |   11 +++++++++++
>>  scripts/kconfig/zconf.gperf |    1 +
>>  scripts/kconfig/zconf.y     |   21 ++++++++++++++++++---
>>  5 files changed, 32 insertions(+), 3 deletions(-)
>>
> As there seem to be no interested from Michal to either, ACK, NACK, or
> even comment this series, please let me withdraw these patches. If
> this mail is not enough to void the patch, I hope to still be able to
> withdraw my Signed-off-by from this particular series, and thus no
> longer be able to certify the origin of the patches to prevent their
> merge.

Hi Arnaud,

I'm sorry, I was sick for longer time and am now going through the
patches that accumulated during that time. I understand your
frustration, but the fact that I commented / applied some other patches
yesterday and not this one does not mean that I'm ignoring it. Please
accept my apologies, I'm looking at your patch right now...

Michal
