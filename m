Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505094;
	b=gzO48HMjADLlgC2k3L9txbWx3IAe4mnlbW8j0KhvJ7+9r0h8w+GxiOwqF7BTsLGFyV5p
	 r/53KOfSmd+RZffQECaAlmyWDh01cbSSskqdtGrWSO2mvjLjs6GNlH2sd65QZGIUzhcuD
	 di/5O+VcAET4bymV3sNJjp1JB+SG/uHoezySIthQzMiAZoXdkeo0By5x10+jMW/NFKB48
	 99JaaexfUxARUadxjnvzyBUNgnT0bXznH9QcbdBuDV9+1ohkM/GU/AeDGulMDP4UCJHa4
	 0YAYQthOSE26PZjMIJQfcRYncpJjrkiScQfFL/x51ghhQKONB+Rs9/A6XRAOeFyUyEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505094;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rPpDfKVH7+4ZQFZ2BNSiTKNzv7DLDlFf+/IJ01jJcyY=;
	b=YJQwJXCvfqc9l6kh1vnkIe0J7lHcR6t/PxqpHUZVVM9YKrjW1K8+FgE0rG5s8DMImpuX
	 7YgTAB6EjB+ECJV+s8qUXMX4OwBPAS1d6IJbM5emT6opkxvIXFBGkbRiIaZyMk1rxh1ob
	 tmRwxwm12/7r/CPAokLP00JwDE3rMVSSWppe5gp+6t6GmCHApmM8TWlINO11vaBicksY2
	 MmWQr74VkqX+Xq0YKKitWcgLsFvLnU9YDyEymO8G6W+quwy6jdKBhaEIi3M2exwQ9qKDx
	 Zf+qc8I8ie2YOwaY2dAGVENKuLO1Z6aQiR9BOeUQA9g6crIZyH8KmG91TeeSP5RGQDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kVf/QRdo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD9606A321;
	Tue, 24 Nov 2026 07:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVf/QRdo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E876C1F000CA;
	Tue, 24 Nov 2026 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795505093;
	bh=rPpDfKVH7+4ZQFZ2BNSiTKNzv7DLDlFf+/IJ01jJcyY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=kVf/QRdoDMHTMQbb2xejPdPpk0Z/3tBHz3TRXLcL97jOMZ6jrw0oCU07bKWKJwXlK
	 VcQlQ1C7KpM1p7216MNHedVcG89nKawR4GOt39uM6ZMCKY8EtfJ9Fsm/h3/F7Nr5m6
	 +4ADEzqwmt05bb0zw1Qza6SUtR3RNW3BfO8mMshf+eG+ibGHni8NCiKr7CTjCVh6f+
	 Z10sZHRx/JXvyC98ixvR1FAVDVMywuGUuKiOfpm6CpSkhPpGVgVu6YbnEatTbyOd5J
	 Pdl2DwhF0gGaDKz0nS7qvRC9mU01g8rjbb3uMMiFCtOn8JSf9/nygamzjEv+hHJ/E6
	 5eHnXyL5kskMw==
Message-ID: <ad506392-9010-4955-8251-602bf79c2286@kernel.org>
Date: Tue, 24 Nov 2026 08:24:50 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] kbuild: move scripts/mod target out of single-build
To: Nicolas Schier <nsc@kernel.org>, sashiko-reviews@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
References: <20261111-reduce-single-build-dependencies-v1-0-7196ca986a85@kernel.org>
 <20261111-reduce-single-build-dependencies-v1-3-7196ca986a85@kernel.org>
 <sashiko-outbox-211218@kernel.org> <awRvU8_wAUlkd1Nj@levanger>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBAhsDBQsJCAcC
 AiICBhUKCQgLAgQWAgMBAh4HAheAFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmrTM8wFCR1O
 HxcACgkQq1/riG27mcJ2KAEAhG19xBSkjiA9dtatvq2WJnGaes4SUmY+LSn7dh1Lf7YBAIwB
 lsMMmigMTk3Qgwymg1nT+Z8z1Owc/TGtRlo4ZcwMzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmAhsMFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmrTNKcFCRUFdT0ACgkQq1/riG27mcLEVwD/VmnQtTf6yhowaIFj
 AjUtwiyQz9ja4NRu9GOvz/pb2L8A/3QcADR0dcxADGsmOiBpN2M9KI7nqdNIq3VPM/3/5fcB
In-Reply-To: <awRvU8_wAUlkd1Nj@levanger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nicolas,

Thanks for the review!

On 23/11/2026 at 17:52, Nicolas Schier wrote:
> On Thu, Nov 12, 2026 at 01:45:43PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [Low] kbuild: unordered modpost_prepare and stack_protector_prepare
>>   mutates CFLAGS
>> --
>>
>> commit 08ffc13380249741520c2ea434688d701b5d0e9b
>> Author: Vincent Mailhol <mailhol@kernel.org>
>>
>> kbuild: move scripts/mod target out of single-build
>>
>> This commit moves the scripts/mod build out of prepare0 into a new
>> modpost_prepare target depended on by modules_prepare and modpost.
>>
>>> diff --git a/Makefile b/Makefile
>>> index 2c1289a44c560..93236f310f080 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1405,7 +1405,7 @@ scripts: scripts_basic scripts_dtc
>>>  # archprepare is used in arch Makefiles and when processed asm symlink,
>>>  # version.h and scripts_basic is processed / created.
>>>  
>>> -PHONY += prepare archprepare
>>> +PHONY += prepare archprepare modpost_prepare
>>>  
>>>  archprepare: outputmakefile archheaders archscripts scripts include/config/kernel.release \
>>>  	asm-generic $(version_h) include/generated/utsrelease.h \
>>> @@ -1414,6 +1414,8 @@ archprepare: outputmakefile archheaders archscripts scripts include/config/kerne
>>>  
>>>  prepare0: archprepare
>>>  	$(Q)$(MAKE) $(build)=. prepare $(if $(single-build),,prepare_checks)
>>> +
>>> +modpost_prepare: archprepare
>>>  	$(Q)$(MAKE) $(build)=scripts/mod
>>
>> [Severity: Low]
>> Should modpost_prepare be ordered relative to stack_protector_prepare (or
>> depend on prepare)?
>>
>> On arm, arm64, powerpc, and riscv, prepare depends on
>> stack_protector_prepare, which depends on prepare0 and mutates the
>> exported KBUILD_CFLAGS variable at recipe execution time:
>>
>> arch/arm64/Makefile:
>> prepare: stack_protector_prepare
>> stack_protector_prepare: prepare0
>> 	$(eval KBUILD_CFLAGS += -mstack-protector-guard=sysreg		  \
>> 				-mstack-protector-guard-reg=sp_el0	  \
>> 				-mstack-protector-guard-offset=$(shell	  \
>> 			awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
>> 				$(objtree)/include/generated/asm-offsets.h))
>>
>> Previously, scripts/mod was built inside prepare0, so it always ran before
>> stack_protector_prepare modified KBUILD_CFLAGS.  With modpost_prepare
>> only depending on archprepare, a parallel build runs modpost_prepare
>> concurrently with prepare0 before stack_protector_prepare updates
>> KBUILD_CFLAGS, whereas a serial build or make modules_prepare runs
>> prepare first and passes the updated KBUILD_CFLAGS to scripts/mod.
>>
>> Because scripts/mod/empty.o is compiled with KBUILD_CFLAGS, switching
>> between parallel and serial or single-module builds changes its recorded
>> command line, rebuilding empty.o, regenerating elfconfig.h (which uses
>> if_changed), and forcing a full rebuild of modpost.
> 
> Well yes,
> 
>    make scripts/mod/empty.o && make modules
> 
> leads to a rebuild of empty.o and modpost triggered by 'make modules'.
> But if that is the only negative implication, this is not relevant as I
> expect no human wants to build scripts/mod/empty.o as a single-target.

This is indeed a low priority report, but regardless, after thinking a
bit about it, I came up with a v2 which I found a bit more elegant:

https://lore.kernel.org/all/20261113-reduce-single-build-dependencies-v2-0-93ba1f6c4e46@kernel.org/

The dependencies goes from v1:

  modpost_prepare: archprepare
  modules_prepare: prepare modpost_prepare

to v2:

  modpost_prepare: prepare
  modules_prepare: modpost_prepare

It both resolves the issue and read more naturally.


Yours sincerely,
Vincent Mailhol
