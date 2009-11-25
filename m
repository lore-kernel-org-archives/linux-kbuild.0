Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:24007 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752270AbZKYJPR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2009 04:15:17 -0500
Message-ID: <4B0CF5A6.7080908@tuffmail.co.uk>
Date: Wed, 25 Nov 2009 09:15:18 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 05/10] kbuild: sort the list of symbols exported by the
 kernel (__ksymtab)
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com>	 <4B072E31.4000906@tuffmail.co.uk> <20091123195320.GD26810@ldl.fc.hp.com>	 <200911241127.18013.rusty@rustcorp.com.au>	 <1259041182.2433.945.camel@mulgrave.site> <4B0BA725.2050604@tuffmail.co.uk> <1259102629.4549.842.camel@mulgrave.site>
In-Reply-To: <1259102629.4549.842.camel@mulgrave.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Alex Chiang <achiang@hp.com>, Tony Luck <tony.luck@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Mike Frysinger <vapier.adi@gmail.com>, greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, paulus@samba.org

James Bottomley wrote:
> On Tue, 2009-11-24 at 09:28 +0000, Alan Jenkins wrote:
>   
>> James Bottomley wrote:
>>     
>>> On Tue, 2009-11-24 at 11:27 +1030, Rusty Russell wrote:
>>>   
>>>       
>>>> On Tue, 24 Nov 2009 06:23:20 am Alex Chiang wrote:
>>>>     
>>>>         
>>>>> Hi Alan, Rusty,
>>>>>       
>>>>>           
>>>> Hi Alex,
>>>>
>>>>     
>>>>         
>>>>> In the meantime, while Alan is deciding the proper way to fix
>>>>> this, would it be possible to drop the offending patch series
>>>>> from linux-next?
>>>>>       
>>>>>           
>>>> Done.  That takes the pressure off Alan, and makes sure he has time to get
>>>> it right.
>>>>     
>>>>         
>>> That probably suits us on parisc too.  I just checked out our build in
>>> linux-next: we don't pass __modpost ... it looks like we have all the
>>> module symbols undefined.  Will investigate more.
>>>
>>> James
>>>   
>>>       
>> I think parisc wants P'printk where ia64 uses @fptr(printk).
>>
>> It may also need ".import printk,code" or similar.
>>     
>
> I think if you have to make modpost architecture specific, there's
> something a bit wrong in the patch series.
>
> I can confirm that reverting this particular patch allows the parisc
> build to work again.  It still won't boot because module symbols aren't
> resolved.
>
> James
>   

Yes, the series as a whole relies on that patch.  Rusty pulled the 
series from linux-next (thanks rusty!).

I'm working on alternatives now.  I can't promise to avoid architecture 
specific code, but if it's necessary then I understand I have to arrange 
to test it myself :-).  Sorry for the inconvenience caused by 
"arch-independent assembly code" that wasn't.

Alan
