Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58671 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754464AbcDVRDF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Apr 2016 13:03:05 -0400
Subject: Re: [PATCH] scripts: kconfig: implement a sort method
References: <1461269279-11525-1-git-send-email-felipe.balbi@linux.intel.com>
 <57195E78.9080805@infradead.org> <87shye84u0.fsf@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <571A5946.3@infradead.org>
Date: Fri, 22 Apr 2016 10:03:02 -0700
MIME-Version: 1.0
In-Reply-To: <87shye84u0.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Balbi <balbi@kernel.org>, Felipe Balbi <balbif@gmail.com>, yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/22/16 00:45, Felipe Balbi wrote:
> 
> Hi,
> 
> Randy Dunlap <rdunlap@infradead.org> writes:
>> On 04/21/16 13:07, Felipe Balbi wrote:
>>> With a growing amount of Kernel configuration, it's
>>> getting ever more difficult to find anything on
>>> menuconfig. Because of that, implement mergesort for
>>> kconfig to make it a little easier for anybody
>>> building kernels.
>>
>> Hi,
>>
>> Please explain the problem and the solution better.  I don't
>> get it.
> 
> it's unclear to me what you don't understand from description above. Try
> to find and enable some random driver on menuconfig. Here's a
> suggestion:
> 
> "Maxim Semiconductor MAX77843 PMIC Support"
> 

yeah, I had no problem with that.  / (Search) works very well, sorted
or not.

Maybe I'm not in your target market.


> In any case, the idea is the following:
> 
> menuconfig has too many options, they are unsorted -> sort them
> 


The addition of < Sort > to the bottom menu items is displayed (partially)
in an 80-column-wide terminal window: (oh, I see, it wraps, still not good)

  ├─────────────────────────────────────────────────────────────────────────┤  
  │        <Select>    < Exit >    < Help >    < Save >    < Load >    < Sort  
   >────────────────────────────────────────────────────────────────────────┘  
    


I still think that you have an inadequate problem statement to justify
the patch.  Nothing against the patch itself.

thanks,
-- 
~Randy
