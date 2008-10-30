Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.184]:21706 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754055AbYJ3L2b (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Oct 2008 07:28:31 -0400
Received: by nf-out-0910.google.com with SMTP id d3so233934nfc.21
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Oct 2008 04:28:29 -0700 (PDT)
Date: Thu, 30 Oct 2008 14:31:50 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [patch 12/13] kconfig: add module_name shortcut
Message-ID: <20081030113150.GA27565@x200.localdomain>
References: <200810292120.m9TLKFgx019406@imap1.linux-foundation.org> <20081030110211.GA25873@cs181140183.pp.htv.fi> <49099771.8000302@cateee.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49099771.8000302@cateee.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: "Giacomo A. Catenazzi" <cate@cateee.net>, akpm@linux-foundation.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, zippel@linux-m68k.org

On Thu, Oct 30, 2008 at 12:16:01PM +0100, Giacomo A. Catenazzi wrote:
> Adrian Bunk wrote:
>> On Wed, Oct 29, 2008 at 02:20:14PM -0700, akpm@linux-foundation.org wrote:
>>> From: Alexey Dobriyan <adobriyan@gmail.com>
>>>
>>> Add Kconfig token "module_name" to supply module's name. Example:
>>>
>>> 	config FOO
>>> 		tristate "foo"
>>> 		module_name foo
>>> 		---help---
>>> 		  foo
>>>
>>> Print module's name as following on menuconfigs help screen (press 'h'):
>>>
>>> 	Module name: foo
>>>
>>> 8139too driver converted to show real-life example.
>>>
>>> P.S.: menuconfig only, no checking wrt modular/standalone code et al.
>>> ...
>>
>> We have 4 interfaces, and for not losing information all of them have 
>> to support it.
>>
>>> --- a/drivers/net/Kconfig~kconfig-add-module_name-shortcut
>>> +++ a/drivers/net/Kconfig
>>> @@ -1549,14 +1549,12 @@ config 8139TOO
>>>  	depends on NET_PCI && PCI
>>>  	select CRC32
>>>  	select MII
>>> +	module_name 8139too
>>>  	---help---
>>>  	  This is a driver for the Fast Ethernet PCI network cards based on
>>>  	  the RTL 8129/8130/8139 chips. If you have one of those, say Y and
>>>  	  read the Ethernet-HOWTO <http://www.tldp.org/docs.html#howto>.
>>>  -	  To compile this driver as a module, choose M here: the module
>>> -	  will be called 8139too.  This is recommended.
>>> -
>>> ...
>>
>> Are you planning any further usage of the module_name?
>>
>> Currently your patch seems to be in menuconfig equivalent to
>>
>> -       To compile this driver as a module, choose M here: the module
>> -       will be called 8139too.  This is recommended.
>> +	Module name: 8139too
>>
>> I don't have any strong opinion whether that's better or worse, but if  
>> that's the only change we don't need a new kconfig syntax for it.

Well, it can be extended into "goto Kconfig symbol which controls this module
[enter module name]". Or something else.

We can check if bool symbol has module_name for some reason and investigate.

Kconfig and Makefiles are deeply interconnected and module_name exploits that.
