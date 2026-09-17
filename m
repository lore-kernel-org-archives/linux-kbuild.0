Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC938B158;
	Thu, 17 Sep 2026 02:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789612027; cv=none; b=qBzAXEZeHPLbMxgfHu8CMQL9mTDv2zWIWQsGlL0CldMEoHae64de/XePCcNDDr8mPwatbmVuaEoXA8JugxLRYmCWUtsfL6jySKCCFFz76jCamOs0l4IeJF3HpHGEYEw/gy20IKMDOHmkFyVMAovOpaLrY3eHrtuqRAyMvS+gojQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789612027; c=relaxed/simple;
	bh=BQ4nP67WTHmAtX91uaMXVgi3ZWvkb2mVljiH/+Zt75k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RafEQdvNpt/tqW1vB+ZszLBi3bPOZFC7YiOXaaXklqMX9HgZgCi9GhnfTvLHUDGWrgDE+fUAE8p2Dgp6o4WZslhtVA+9f/mLxtMTrzm3aRHHEC6sJeYlPDlZ8YhqLp3gXcHNqsMgIYOhsxLdj2+1WGTp/dpVbiBH+PZz8mY5jbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tPhw4yLZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tPhw4yLZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=D1KLpoKH4xmfHyYccYxdDOS0ppbI15ivYmxH1PUTNwQ=; b=tPhw4yLZyvstTPW931k/aUncKT
	J6HcnTf9P7PeqreFQJFw2EONQ6GPcxKKjrpGKulYiAwapnxt8+VetDdulaV6gLSf9n3yWfNDkXPjR
	lBtSUiKTBsVKLSLvLjW2Gsz/Slb2gZ3pqBpkDMcoNtrkS87TxEoRZUziQUf/CJ+ywLf3GRvY3STkD
	eAclF2Xr0GD7mxB+xmTFThuA/DWu2re1BYXcpqd3JmZsiX9xc/5oAG2WMvc9AhxVzROZFEEVOhz/Q
	tKrXsePF/nhSfGsyCS7Np1FHXnmhuqgaB/fDT6EFf7GxVEP0r/4LhC6Gmkwhy43MSSY19tR7oHawu
	q1IaPSaA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x71pZ-0000000ASi5-3BMn;
	Thu, 17 Sep 2026 02:26:33 +0000
Message-ID: <11656273-5267-4326-a01a-34d8bac7ef14@infradead.org>
Date: Wed, 16 Sep 2026 19:26:33 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: add header check facility as a manually run
 static analyzer
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nicolas Schier <nsc@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <20260915104331.255636-1-jani.nikula@intel.com>
 <211fcac1-d85d-4680-8e55-598b2064a002@infradead.org>
 <20260916231319.GA550816@ax162>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260916231319.GA550816@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/16/26 4:13 PM, Nathan Chancellor wrote:
> On Wed, Sep 16, 2026 at 03:24:09PM -0700, Randy Dunlap wrote:
>> On 9/15/26 3:43 AM, Jani Nikula wrote:
>>> There have been various attempts at adding a header test or check
>>> mechanism in the kernel build system. The header check primarily
>>> consists of ensuring headers are self-contained, have include guards,
>>> and, in some cases, pass kernel-doc.
>>>
>>> The main problems have been:
>>>
>>> - The dependency tracking creates undesirable artefacts (infamously also
>>>   known as disgusting turds) in the build directory.
>>>
>>> - Gating the feature behind a kconfig option is complicated due to
>>>   allyesconfig builds. It's possible, but requires a verbose and
>>>   confusing negative proxy config option.
>>>
>>> - Naming the dependency tracking files with a dot prefix or placing them
>>>   in a dot prefixed subdirectory in the build directory to hide them has
>>>   been exceedingly difficult to achieve. (In part due to some Makefiles
>>>   building files in subdirectory hierarchies.)
>>>
>>> - The debate which headers, if any, should really be self-contained is
>>>   virtually open-ended.
>>
>> I would expect that headers in include/uapi/*.h should be self-contained,
>> but apparently that's just a pipe dream on my part, or maybe it's just
>> a maintainer option.
>>
>> With 'make HEADER_CHECK="include/uapi/" headercheck'
>> I see over 70 errors (mostly typedefs or defined constants, but not only
>> those), such as:
>>
>> In file included from <command-line>:
>> ./../include/uapi/linux/hdlc/ioctl.h:74:21: error: ‘IFNAMSIZ’ undeclared here (not in a function)
>>    74 |         char master[IFNAMSIZ];  /* Name of master FRAD device */
>>       |                     ^~~~~~~~
>> In file included from <command-line>:
>> ./../include/uapi/linux/input.h:29:6: warning: ‘__BITS_PER_LONG’ is not defined, evaluates to ‘0’ [-Wundef]
>>    29 | #if (__BITS_PER_LONG != 32 || !defined(__USE_TIME_BITS64)) && !defined(__KERNEL__)
>>       |      ^~~~~~~~~~~~~~~
>> ./../include/uapi/linux/input.h:34:9: error: unknown type name ‘__kernel_ulong_t’
>>    34 |         __kernel_ulong_t __sec;
>>       |         ^~~~~~~~~~~~~~~~
>> In file included from ./../include/uapi/linux/papr_pdsm.h:14,
>>                  from <command-line>:
>> ../include/linux/ndctl.h:19:33: error: ‘PAGE_SIZE’ undeclared here (not in a function)
>>    19 |         ND_MIN_NAMESPACE_SIZE = PAGE_SIZE,
>>       |                                 ^~~~~~~~~
>> In file included from <command-line>:
>> ./../include/uapi/linux/patchkey.h:15:2: error: #error "patchkey.h included directly"
>>    15 | #error "patchkey.h included directly"
>>       |  ^~~~~
>> In file included from <command-line>:
>> include/uapi/xen/gntdev.h:159:25: error: unknown type name ‘grant_ref_t’
>>   159 |                         grant_ref_t ref;
>>       |                         ^~~~~~~~~~~
>> include/uapi/xen/gntdev.h:161:25: error: unknown type name ‘domid_t’
>>   161 |                         domid_t domid;
>>       |                         ^~~~~~~
> 
> include/uapi already has its own header checking infrastructure under
> CONFIG_UAPI_HEADER_TEST and usr/include/Makefile, which avoids this with
> a no-header-test list that includes many of the files listed in these
> messages. To be honest, we should probably forbid HEADER_CHECK from
> including 'include/uapi' and refer people to use CONFIG_UAPI_HEADER_TEST
> instead, as there are other differences like being built under a
> different C standard or C++ and such that the existing infrastructure
> handles.
> 

Thanks for the reminder. I'll limit any checking I do to non-uapi files.

> That said, I think the overall idea seems fine and relatively clean, at
> least from my Kbuild perspective, as it is completely opt in, so the
> previous objection to CONFIG_HEADER_CHECK_DISABLE and widely exposing
> this to builds is pretty much moot.
> 

-- 
~Randy

