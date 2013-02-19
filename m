Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52329 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754764Ab3BSMtg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Feb 2013 07:49:36 -0500
Message-ID: <512374CF.2000302@suse.cz>
Date: Tue, 19 Feb 2013 13:49:19 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: Bug#636029: [PATCH] kbuild: Fix missing '\n' for NEW symbols
 in yes "" | make oldconfig >conf.new
References: <20130219002426.GA19381@nt1.in> <1361252386.5374.564.camel@deadeye.wl.decadent.org.uk>
In-Reply-To: <1361252386.5374.564.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Regid Ichira <regid23@nt1.in>, 636029@bugs.debian.org, linux-kbuild@vger.kernel.org, Jonathan Nieder <jrnieder@gmail.com>

On 19.2.2013 06:39, Ben Hutchings wrote:
> On Tue, 2013-02-19 at 02:24 +0200, Regid Ichira wrote:
>> From: Ben Hutchings <ben@decadent.org.uk>
>>
>> According to Documentation/kbuild/kconfig.txt, the commands:
>>
>>     yes "" | make oldconfig >conf.new
>>     grep "(NEW)" conf.new
>>
>> should list the new config symbols with their default values.
>> However, currently there is no line break after each new symbol.  When
>> kconfig is interactive the user will type a new-line at this point,
>> but when non-interactive kconfig must print it.
>>
>> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
>> ---
> 
> Don't put a '---' here, as the following pseudo-headers should go into
> the commit message.
> 
>> Reference: http://bugs.debian.org/636029
>> Reported-by: 636029-submitter@bugs.debian.org
> 
> Well that's you, isn't it?
> 
>> [regid23@nt1.in: Adjusted Ben's work to apply cleanly to this tree]
>> Tested-by: Regid Ichira <regid23@nt1.in>
> [...]
> 
> So it should be Reported-and-tested-by: Regid Ichira <regid23@nt1.in>

I applied the patch with this tag to kbuild.git#kconfig.

Michal
