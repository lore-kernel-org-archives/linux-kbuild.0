Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:57908 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755704Ab3H1VGA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Aug 2013 17:06:00 -0400
Message-ID: <521E661B.1030802@zytor.com>
Date: Wed, 28 Aug 2013 14:05:31 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: 32bit allyesconfig on 64bit system broke
References: <20130809225736.GG19750@two.firstfloor.org> <520A97C1.6000708@suse.cz>
In-Reply-To: <520A97C1.6000708@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kbuild@vger.kernel.org

On 08/13/2013 01:32 PM, Michal Marek wrote:
> Dne 10.8.2013 00:57, Andi Kleen napsal(a):
>>
>> % linux32 make allyesconfig
>> % head .config
>> % head .config
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86 3.11.0-rc4 Kernel Configuration
>> #
>> CONFIG_64BIT=y
>> CONFIG_X86_64=y
>> CONFIG_X86=y
>>
>> This used to work to give me a 32bit allyesconfig.
>> How am I supposed to do this now?
> 
> This changed in ffee0de (x86: Default to ARCH=x86 to avoid overriding
> CONFIG_64BIT). The default $ARCH value on both ix86 and x86_64
> buildhosts is "x86" and CONFIG_64BIT is therefore a user-selectable
> knob. You can do
> 
>   make ARCH=i386 allyesconfig
> 
> to force 32bit. Or the generic way:
> 
>   echo '# CONFIG_64BIT is not set' >base.config
>   KCONFIG_ALLCONFIG=base.config linux32 make allyesconfig
> 

"make ARCH=i386 allyesconfig" has been the standard way to do this for
quite a few years, so that is the forward and backwards compatible way.

	-hpa


