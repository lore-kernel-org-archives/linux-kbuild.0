Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:5477 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932455AbZKXJ2E (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Nov 2009 04:28:04 -0500
Message-ID: <4B0BA725.2050604@tuffmail.co.uk>
Date: Tue, 24 Nov 2009 09:28:05 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 05/10] kbuild: sort the list of symbols exported by the
 kernel (__ksymtab)
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>	 <4B072E31.4000906@tuffmail.co.uk> <20091123195320.GD26810@ldl.fc.hp.com>	 <200911241127.18013.rusty@rustcorp.com.au> <1259041182.2433.945.camel@mulgrave.site>
In-Reply-To: <1259041182.2433.945.camel@mulgrave.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Alex Chiang <achiang@hp.com>, Tony Luck <tony.luck@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Mike Frysinger <vapier.adi@gmail.com>, greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, paulus@samba.org

James Bottomley wrote:
> On Tue, 2009-11-24 at 11:27 +1030, Rusty Russell wrote:
>   
>> On Tue, 24 Nov 2009 06:23:20 am Alex Chiang wrote:
>>     
>>> Hi Alan, Rusty,
>>>       
>> Hi Alex,
>>
>>     
>>> In the meantime, while Alan is deciding the proper way to fix
>>> this, would it be possible to drop the offending patch series
>>> from linux-next?
>>>       
>> Done.  That takes the pressure off Alan, and makes sure he has time to get
>> it right.
>>     
>
> That probably suits us on parisc too.  I just checked out our build in
> linux-next: we don't pass __modpost ... it looks like we have all the
> module symbols undefined.  Will investigate more.
>
> James
>   

I think parisc wants P'printk where ia64 uses @fptr(printk).

It may also need ".import printk,code" or similar.

Thanks
Alan

