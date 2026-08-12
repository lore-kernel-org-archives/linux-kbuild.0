Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2C3515FA;
	Wed, 12 Aug 2026 12:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539350; cv=none; b=DEPwsRz9M8117SeP4y9joEkkC0QayzUBJqi801im7wSRN22w/Cf9DaJPtQY6wba3nuAKFIpz3g45Gtt2YTgKyKQfzRvH2sgplaAQshEX74ZxgG8FxLLEuKFLPte8sOsM5Uhk0RrZgv2p6rQ1n1pXw39J9pkJJRh5OO0Rxj7eWmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539350; c=relaxed/simple;
	bh=2JYqUjxLrCbUCuhOVWJCfZ6oYrSWMLxvI0oDfO0uHRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRseWoDP5D2Z5NJxGnsp2y3tuQvAQzx9pZejfW2GYzzBzB1bG86lUOjowvRDnzH1BJv3O6WeVsZc2pM88dRrU22oJ5PIU5s9d1lzuQNfNOawIZddVfHFE9B1RGBtKft3OARGIeqW4GhPgF62S0UacQ8HmXy6GiOsZtSw/YM7Hu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=I9zSYmRC; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="I9zSYmRC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=XPkrCBTNanvCZK+8HXh6gZ3h01dtwTp03SUOd/IcgqI=; b=I9zSYmRChLEZGLe0q7pdBIF247
	y6yk2hP2DAnojqnD/03m3Y24AJ4nX5QyJGsTixPkiqAtR7tLgDNtf+WeCe3Yu58Lg7WeSWL8g6opn
	VkFLpCaXRvJ/K070wr9JiGZb8tdUEKpVyu9gjRiIuup3fN/EqloBHFdT2trdaLNaQ6IpeiTRIPl5S
	t9ESP+AabnzAxTJhpgjtVhe7LVbIl94krJZxQgh5nVjjk5ksPpWdepJFBW1KiA4o+Q5ehNE0rpxym
	NaJtkPqsAET9VXJdor8Tw1CMvyP6Z+hcWh04dsHi4SmodoaEPrNlgv2GjjGWlT9+cxTM8LZ7MAjAc
	629LVnRw==;
Received: from [177.139.22.20] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wu8Ui-0001zu-Eu; Wed, 12 Aug 2026 14:55:44 +0200
Message-ID: <f06d1b64-aec2-4f9e-9621-fed95f40ae61@igalia.com>
Date: Wed, 12 Aug 2026 09:55:44 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/12] alpha: Use the common syscall table
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com
References: <20260812-tonyk-syscall_table-v4-0-748d0229ad40@igalia.com>
 <20260812-tonyk-syscall_table-v4-12-748d0229ad40@igalia.com>
 <581ec9d7-d308-4fcf-bcf9-f243661fcc59@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <581ec9d7-d308-4fcf-bcf9-f243661fcc59@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 12/08/2026 06:09, Arnd Bergmann escreveu:
> On Wed, Aug 12, 2026, at 05:33, André Almeida wrote:
>> Remove some of the duplicated code by using the common syscall number
>>
>>   quiet_cmd_syshdr = SYSHDR  $@
>> -      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
>> +      cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr \
>> +		   --common-tbl $(systbl_common) --common-offset 110 \
>> +		   --abis $(abis) $< $@
>>
>>   quiet_cmd_systbl = SYSTBL  $@
>> -      cmd_systbl = $(CONFIG_SHELL) $(systbl) $< $@
>> +      cmd_systbl = $(CONFIG_SHELL) $(systbl) \
>> +		   --common-tbl $(systbl_common) --common-offset 110 \
>> +		   --abis $(abis) $< $@
> 
> The --common-offset agument does seem simple enough here and it
> avoids processing the files separately.
> 
>> @@ -45,6 +45,7 @@
>>   434	common	pidfd_open			sys_pidfd_open
>>   435	clone3	clone3				sys_clone3
>>   435	__clone3	clone3			__sys_clone3
>> +435     alpha  	clone3                          alpha_clone3
>>   436	common	close_range			sys_close_range
>>   437	common	openat2				sys_openat2
>>   438	common	pidfd_getfd			sys_pidfd_getfd
> 
> I think it would be nicer to change the "fork_like" macro in
> arch/alpha/kernel/entry.S to use the same __sys_clone3 name
> (and fork/vfork/clone) that we have on
> m68k/mips/nios2/openrisc/sparc and save another special case.
> 

Ok, I will follow this approach for now.

Thanks!
