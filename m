Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:55211 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752560AbbERJix (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 May 2015 05:38:53 -0400
From: Martin Walch <walch.martin@web.de>
Subject: Re: [PATCH v3] Kconfig: Remove bad inference rules expr_eliminate_dups2()
Date: Mon, 18 May 2015 11:38:47 +0200
Message-ID: <5729946.JOCDOEaf0S@tacticalops>
In-Reply-To: <55599663.6080203@suse.cz>
References: <6333557.fobqH0bixi@tacticalops> <55599663.6080203@suse.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org

On Monday 18 May 2015 15:36:03 Michal Marek wrote:
> Are you able to construct a testcase that triggers this bug? I haven't
> been successful:
> [..]
> config TEST1
> 	def_tristate (FOO || BAR) && (!FOO && !BAR)

This does not trigger the bug, because expr_eliminate_dups is only applied
to dependencies, but not to the expressions of default values.

I modified your example a bit, so that the bug becomes apparent:

config MODULES
        def_bool y
        option modules

config FOO
        def_tristate m

config BAR
        def_tristate m

config TEST1
        def_tristate y
        depends on (FOO || BAR) && (!FOO && !BAR)

if TEST1 = n
comment "TEST1 broken"
endif

config TEST2
        def_tristate y
        depends on (FOO && BAR) || (!FOO || !BAR)

if TEST2 = y
comment "TEST2 broken"
endif

config TEST3
        def_tristate y
        depends on m && !m

if TEST3 = n
comment "TEST3 broken"
endif


As you can see, I also added a third symbol TEST3 with a line 
> depends on m && !m

This case is special: m && !m expands to (m && MODULES) && !(m && MODULES),
then it is transformed into (m && MODULES) && (!m || !MODULES), and finally
due to the bug it is replaced with n.

Regards,
Martin Walch
-- 

