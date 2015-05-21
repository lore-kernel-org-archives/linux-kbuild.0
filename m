Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47492 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751278AbbEUGjc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 May 2015 02:39:32 -0400
Message-ID: <555D7D9C.7010701@suse.cz>
Date: Thu, 21 May 2015 14:39:24 +0800
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3] Kconfig: Remove bad inference rules expr_eliminate_dups2()
References: <6333557.fobqH0bixi@tacticalops> <55599663.6080203@suse.cz> <5729946.JOCDOEaf0S@tacticalops>
In-Reply-To: <5729946.JOCDOEaf0S@tacticalops>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Martin Walch <walch.martin@web.de>
Cc: linux-kbuild@vger.kernel.org

Dne 18.5.2015 v 17:38 Martin Walch napsal(a):
> On Monday 18 May 2015 15:36:03 Michal Marek wrote:
>> Are you able to construct a testcase that triggers this bug? I haven't
>> been successful:
>> [..]
>> config TEST1
>> 	def_tristate (FOO || BAR) && (!FOO && !BAR)
> 
> This does not trigger the bug, because expr_eliminate_dups is only applied
> to dependencies, but not to the expressions of default values.
> 
> I modified your example a bit, so that the bug becomes apparent:

Thanks, now I can reproduce it as well. Would you be so kind add this
reproducer to the changelog?

Thanks,
Michal
