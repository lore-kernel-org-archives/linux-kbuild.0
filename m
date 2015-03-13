Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:1318 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751306AbbCMV33 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 17:29:29 -0400
Date: Fri, 13 Mar 2015 14:29:26 -0700
Subject: Re: [PATCH 0/6] kbuild: mergeconfig: fix bugs, improve readability,
 and add generic entry point
From: Darren Hart <dvhart@linux.intel.com>
Message-ID: <D128A497.C1D73%dvhart@linux.intel.com>
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
 <20150313082716.GA11052@thin>
In-Reply-To: <20150313082716.GA11052@thin>
Mime-version: 1.0
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Josh Boyer <jwboyer@redhat.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

On 3/13/15, 1:27 AM, "Josh Triplett" <josh@joshtriplett.org> wrote:

>On Fri, Mar 13, 2015 at 03:21:37PM +0900, Masahiro Yamada wrote:
>> 
>> This series is related to mergeconfig (scripts/kconfig/merge_config.sh):
>> 
>> 1/6 and 2/6 fix bugs related to the parallel build. (-j option).
>> 3/6 thru 5/6 are minor clean-ups.
>> 6/6 is a new feature; add a generic entry point of mergeconfig.
>> 
>> The last one is RFC.
>> 
>> Masahiro Yamada (6):
>>   kbuild: mergeconfig: fix "jobserver unavailable" warning
>>   kbuild: mergeconfig: move an error check to merge_config.sh
>>   kbuild: mergeconfig: remove redundant $(objtree)
>>   merge_config.sh: improve indentation
>>   merge_config.sh: rename MAKE to RUNMAKE
>>   kbuild: add generic mergeconfig target, %.config

Nice improvements, thank you.

>
>For all six:
>
>Reviewed-by: Josh Triplett <josh@joshtriplett.org>
>

Likewise:

Reviewed-by: Darren Hart <dvhart@linux.intel.com>

-- 
Darren Hart
Intel Open Source Technology Center



