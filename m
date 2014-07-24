Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:59109 "EHLO
	services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934276AbaGXIkI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jul 2014 04:40:08 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [PATCH 1/2] kbuild: Support split debug info v3
In-Reply-To: <20140723182802.GV18735@two.firstfloor.org> (Andi Kleen's message
	of "Wed, 23 Jul 2014 20:28:02 +0200")
References: <1405466172-17055-1-git-send-email-andi@firstfloor.org>
	<20140720190420.GA4630@ravnborg.org>
	<20140720211901.GQ5803@tassilo.jf.intel.com>
	<20140723180501.GA15749@ravnborg.org>
	<20140723182802.GV18735@two.firstfloor.org>
Date: Thu, 24 Jul 2014 10:10:53 +0200
Message-ID: <gh8unjp46q.fsf@quad.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, Andi Kleen <ak@linux.intel.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, mmarek@suse.cz

Andi Kleen <andi@firstfloor.org> writes:

>> echo time make -j4 -s KCFLAGS=-gsplit-dwarf
>> time make -j4 -s KCFLAGS=-gsplit-dwarf
>> echo time make -j4 -s KCFLAGS=-g
>> time make -j4 -s KCFLAGS=-g
>> echo time make -j4 -s KCFLAGS=-gsplit-dwarf
>> time make -j4 -s KCFLAGS=-gsplit-dwarf
>> echo time make -j4 -s KCFLAGS=-g
>> time make -j4 -s KCFLAGS=-g
>> echo time make -j4 -s KCFLAGS=-gsplit-dwarf
>> time make -j4 -s KCFLAGS=-gsplit-dwarf
>> echo time make -j4 -s KCFLAGS=-g
>> time make -j4 -s KCFLAGS=-g
>> 
>> The figures are from last run - but the other runs had compareable times.
>> So in short I see a ~3 seconds speedup - out of 210 seconds.
>> Thats less than I anticipated.
>
> Thanks. How much smaller is it? 
>
> Just saving disk space is a good thing.

Hi Andi,

I applied v3 to rc6+ and did the rudimentary tests that I did with
v1, i.e. make menuconfig, make, make clean, git status and have nothing
to report.

For times an sizes I did tests with my system's .config -- prior to each
`make' I did a `make clean':

split-debug:

# time make -j5 
...

real    6m21.819s
user    22m48.828s
sys     1m1.804s

# du -sh .
2.6G    .

no split-debug:

# time make -j5 
...

real    6m40.311s
user    23m0.648s
sys     1m4.592s

# du -sh .
4.3G    .

Dirk
