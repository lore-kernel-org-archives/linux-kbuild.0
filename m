Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:38049 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806Ab0JHVlD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 Oct 2010 17:41:03 -0400
MIME-Version: 1.0
In-Reply-To: <AANLkTinVkaOWd7bK10CiuOh7MPz3XjSAmDnkwHLsY-pz@mail.gmail.com>
References: <1286496113-11897-1-git-send-email-tdent48227@gmail.com>
	<1286496113-11897-27-git-send-email-tdent48227@gmail.com>
	<20101008142434.GA23666@kroah.com>
	<AANLkTinVkaOWd7bK10CiuOh7MPz3XjSAmDnkwHLsY-pz@mail.gmail.com>
Date: Fri, 8 Oct 2010 17:41:01 -0400
Message-ID: <AANLkTim5wzc6wTHbjA1AtXBLRuxeVB6QGCXcHe9a0_MD@mail.gmail.com>
Subject: Re: [PATCH 27/33] Staging: ti-st: Makefile: replace the use of
 <module>-objs with <module>-y
From: T Dent <tdent48227@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org

On 10/8/10, T Dent <tdent48227@gmail.com> wrote:
> On 10/8/10, Greg KH <greg@kroah.com> wrote:
>> On Thu, Oct 07, 2010 at 08:01:47PM -0400, Tracey Dent wrote:
>>> Changed <module>-objs to <module>-y in Makefile.
>>>
>>> Signed-off-by: Tracey Dent <tdent48227@gmail.com>
>>> ---
>>>  drivers/staging/ti-st/Makefile |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/drivers/staging/ti-st/Makefile
>>> b/drivers/staging/ti-st/Makefile
>>> index 0167d1d..4b6ca18 100644
>>> --- a/drivers/staging/ti-st/Makefile
>>> +++ b/drivers/staging/ti-st/Makefile
>>> @@ -3,5 +3,5 @@
>>>  # and its protocol drivers (BT, FM, GPS)
>>>  #
>>>  obj-$(CONFIG_TI_ST) 		+= st_drv.o
>>> -st_drv-objs			:= st_core.o st_kim.o st_ll.o
>>> +st_drv-y			:= st_core.o st_kim.o st_ll.o
>>>  obj-$(CONFIG_ST_BT) 		+= bt_drv.o
>>
>> For some odd reason, this patch didn't apply to the tree, but all of the
>> 32 other patches in the series did.  Care to redo this one and resend it
>> to me?
>>

The file changed, that why it cant be applied.

>
> Strange but okay.
>
>> thanks,
>>
>> greg k-h
>>
> Thanks,
>
> Tracey D
>
