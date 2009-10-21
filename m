Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:55826 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753207AbZJUODS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 21 Oct 2009 10:03:18 -0400
Date: Wed, 21 Oct 2009 06:48:00 -0700
From: Greg KH <greg@kroah.com>
Subject: Re: Fast LKM symbol resolution with SysV ELH hash table
Message-ID: <20091021134800.GA3332@kroah.com>
References: <4ADACD3A.9020803@gmail.com> <9b2b86520910180544g94ecc8fuf0d7849e18cd8937@mail.gmail.com> <20091018214704.GA26592@kroah.com> <2ccd6e3c0910190445va8ff4a8x94dc4044ac01057d@mail.gmail.com> <20091019132205.GA7192@kroah.com> <2ccd6e3c0910190802w117f8ac1nb562214786904c04@mail.gmail.com> <4ADE9F90.8060608@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ADE9F90.8060608@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Hancock <hancockrwd@gmail.com>
Cc: Carmelo Amoroso <carmelo73@gmail.com>, Alan Jenkins <sourcejedi.lkml@googlemail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Tue, Oct 20, 2009 at 11:43:44PM -0600, Robert Hancock wrote:
> On 10/19/2009 09:02 AM, Carmelo Amoroso wrote:
>> 2009/10/19 Greg KH<greg@kroah.com>:
>>> On Mon, Oct 19, 2009 at 01:45:20PM +0200, Carmelo Amoroso wrote:
>>>> Just a few other notes. The current implementation I did based on SysV
>>>> has a drawback that is not backward compatible, so you cannot use old
>>>> modules with a kernel with the option enabled due to changes on struct
>>>> kernel_symbol.
>>>
>>> Why would this be a problem?  Whenever making a kernel config change,
>>> you should be able to rebuild everything, as lots of other configuration
>>> options are that way.
>>>
>>
>> This is not always true... there could be cases in which you cannot
>> recompile old modules
>> (e.g vendors that provide non GPL modules)
>
> Even non-GPL modules can normally be rebuilt as far as the module format is 
> concerned, there's usually an object file blob that gets compiled into a 
> module on install or something, like the Nvidia graphics driver. If 
> anyone's providing binary-only fully built modules (which would be 
> inherently tied to one exact kernel version and one configuration) they 
> really need to have their head examined..

Welcome to embedded Linux :)
