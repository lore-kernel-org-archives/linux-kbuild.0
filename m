Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from orion2.pixelized.ch ([195.190.190.13]:60921 "EHLO
	orion.pixelized.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460AbYJ3LW2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 30 Oct 2008 07:22:28 -0400
Message-ID: <49099771.8000302@cateee.net>
Date: Thu, 30 Oct 2008 12:16:01 +0100
From: "Giacomo A. Catenazzi" <cate@cateee.net>
MIME-Version: 1.0
Subject: Re: [patch 12/13] kconfig: add module_name shortcut
References: <200810292120.m9TLKFgx019406@imap1.linux-foundation.org> <20081030110211.GA25873@cs181140183.pp.htv.fi>
In-Reply-To: <20081030110211.GA25873@cs181140183.pp.htv.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: akpm@linux-foundation.org, sam@ravnborg.org, linux-kbuild@vger.kernel.org, adobriyan@gmail.com, zippel@linux-m68k.org

Adrian Bunk wrote:
> On Wed, Oct 29, 2008 at 02:20:14PM -0700, akpm@linux-foundation.org wrote:
>> From: Alexey Dobriyan <adobriyan@gmail.com>
>>
>> Add Kconfig token "module_name" to supply module's name. Example:
>>
>> 	config FOO
>> 		tristate "foo"
>> 		module_name foo
>> 		---help---
>> 		  foo
>>
>> Print module's name as following on menuconfigs help screen (press 'h'):
>>
>> 	Module name: foo
>>
>> 8139too driver converted to show real-life example.
>>
>> P.S.: menuconfig only, no checking wrt modular/standalone code et al.
>> ...
> 
> We have 4 interfaces, and for not losing information all of them have to 
> support it.
> 
>> --- a/drivers/net/Kconfig~kconfig-add-module_name-shortcut
>> +++ a/drivers/net/Kconfig
>> @@ -1549,14 +1549,12 @@ config 8139TOO
>>  	depends on NET_PCI && PCI
>>  	select CRC32
>>  	select MII
>> +	module_name 8139too
>>  	---help---
>>  	  This is a driver for the Fast Ethernet PCI network cards based on
>>  	  the RTL 8129/8130/8139 chips. If you have one of those, say Y and
>>  	  read the Ethernet-HOWTO <http://www.tldp.org/docs.html#howto>.
>>  
>> -	  To compile this driver as a module, choose M here: the module
>> -	  will be called 8139too.  This is recommended.
>> -
>> ...
> 
> Are you planning any further usage of the module_name?
> 
> Currently your patch seems to be in menuconfig equivalent to
> 
> -       To compile this driver as a module, choose M here: the module
> -       will be called 8139too.  This is recommended.
> +	Module name: 8139too
> 
> I don't have any strong opinion whether that's better or worse, but if 
> that's the only change we don't need a new kconfig syntax for it.

This feature is very useful for auto configuration: from a lsmod you 
will find easily the relevant configuration.

Actually I'm doing it with some complexer scripts, but some Makefile
are "creative".

I had some plan to include more building information to Kconfig
to automatically generating some part of Makefile's.

ciao
	cate
