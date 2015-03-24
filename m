Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35927 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932423AbbCXPzI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Mar 2015 11:55:08 -0400
Message-ID: <551188DA.3090109@suse.cz>
Date: Tue, 24 Mar 2015 16:55:06 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] kbuild: mergeconfig: fix bugs, improve readability,
 and add generic entry point
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com> <20150313082716.GA11052@thin> <D128A497.C1D73%dvhart@linux.intel.com>
In-Reply-To: <D128A497.C1D73%dvhart@linux.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Josh Boyer <jwboyer@redhat.com>, john stultz <johnstul@us.ibm.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

On 2015-03-13 22:29, Darren Hart wrote:
> On 3/13/15, 1:27 AM, "Josh Triplett" <josh@joshtriplett.org> wrote:
> 
>> On Fri, Mar 13, 2015 at 03:21:37PM +0900, Masahiro Yamada wrote:
>>>
>>> This series is related to mergeconfig (scripts/kconfig/merge_config.sh):
>>>
>>> 1/6 and 2/6 fix bugs related to the parallel build. (-j option).
>>> 3/6 thru 5/6 are minor clean-ups.
>>> 6/6 is a new feature; add a generic entry point of mergeconfig.
>>>
>>> The last one is RFC.
>>>
>>> Masahiro Yamada (6):
>>>   kbuild: mergeconfig: fix "jobserver unavailable" warning
>>>   kbuild: mergeconfig: move an error check to merge_config.sh
>>>   kbuild: mergeconfig: remove redundant $(objtree)
>>>   merge_config.sh: improve indentation
>>>   merge_config.sh: rename MAKE to RUNMAKE
>>>   kbuild: add generic mergeconfig target, %.config
> 
> Nice improvements, thank you.
> 
>>
>> For all six:
>>
>> Reviewed-by: Josh Triplett <josh@joshtriplett.org>
>>
> 
> Likewise:
> 
> Reviewed-by: Darren Hart <dvhart@linux.intel.com>

Added to kbuild.git#kconfig.

Michal

