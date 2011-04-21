Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from diomedes.noc.ntua.gr ([147.102.222.220]:53218 "EHLO
	diomedes.noc.ntua.gr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755601Ab1DUW4N (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 21 Apr 2011 18:56:13 -0400
Message-ID: <4DB0B605.4040201@ece.ntua.gr>
Date: Fri, 22 Apr 2011 01:56:05 +0300
From: Stratos Psomadakis <psomas@ece.ntua.gr>
MIME-Version: 1.0
Subject: Re: [RFC PATCH] kbuild: implement several W= levels
References: <20110421213903.GB9660@merkur.ravnborg.org> <1303423109.24766.97.camel@Joe-Laptop>
In-Reply-To: <1303423109.24766.97.camel@Joe-Laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

On 22/04/2011 12:58 πμ, Joe Perches wrote:
> On Thu, 2011-04-21 at 23:39 +0200, Sam Ravnborg wrote:
>> Building a kernel with "make W=1" produce far too much noise
>> to be usefull.
>> Divide the warning options in three groups:
>> W=1 - usefull warning options
>> W=2 - noisy but semi usefull warnign options
>> W=3 - almost pure noise options
>> +warning-1 := -Wextra
> []
>> +warning-2 += -Waggregate-return
> This is a different form for this first warning-2 declaration
> than the first warning-1 declaration.
>
> Maybe this should be := instead?
yeap...for the first warning-3 assignment too...
maybe something like this:
warning-1:=
warning-2:=
warning-3:=
right after 'ifeq' could help, so that you can alter/test the warnings'
levels more easily(without having to change between := and += for the
first warning of each warning level).

-- 
Stratos Psomadakis
<psomas@ece.ntua.gr>

