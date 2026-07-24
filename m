Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596933515F5;
	Fri, 24 Jul 2026 20:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924345; cv=none; b=lUSauJs7OJvxcqdrpqbqdYOCfkW0XUSh/iGdNhI5T+zBBGKqQN9FShJrETWT/q+znfFrzkRWh9au9+alP6bzxoHz1CHnSj+3J7fDjYnL9rnLYIpdm7ON43XCAvc9pXvnzZGKoQdJO/Vav2jexIYzUyZhbyytupERbqK7vfgv1mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924345; c=relaxed/simple;
	bh=MZmuCQv9NJTiCMJUZZyOw0Qv7dt/IiXkjhD5kuxxxbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVQVS2Colags7sLdvmSehZ0JKsNYDZ/AJnUrUStxeI2sOrw9mO/MRrvMLoqq8X14qXycxsr7HEX+wyJozQUOAbbg5ygduypazJVEMfzHY5fzg1cr67JblDgOlwhTEmc9sM8Ui3qKrbQTFeV56PizwOsWdIi10TOyxUqOzOfclB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lM1sxAzk; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lM1sxAzk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=UAO9jZfdSznnzgQId8AzsSvxqO4ebnsHiv7HRJYIRBc=; b=lM1sxAzkdKKV/TcwqthifGQGH1
	L07dOeppT2pdSxGe0qK1VUFLBkNnEPYZulVZhqd4CNnzlYJ1QIEcmMW+fyCQMl1GcYil2JDlhutOS
	sZvBMl384NcHRZbqzZLuYdlwxkunV3g/TyV6p6jMHYyDJfmDInI/WKRsTNUsJPJYWg2Wuxu/H2P6C
	r02NvwQmiA8l5vNA4RgqKsDNsbfc9fMt7e52aKF6nrCc3QDHl5odvbUhMtMa2GMHb7/+G34XWJde9
	JBWTiByI22WXC4sgYOcGIYqEQpyNtQlFaPTYukXBkufSaEEzGY4X+u/SZv++aLPIWxNr+X5SWUw3j
	Jf+gecDw==;
Received: from [179.118.190.213] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wnMM9-00584h-75; Fri, 24 Jul 2026 22:18:53 +0200
Message-ID: <9a9caecf-5d72-4c68-ad46-5779c3fb73f0@igalia.com>
Date: Fri, 24 Jul 2026 17:18:48 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] syscalls: Create unified partial table for all
 archs
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov
 <bp@alien8.de>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, kernel-dev@igalia.com,
 Thomas Gleixner <tglx@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Ingo Molnar <mingo@redhat.com>
References: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com>
 <20260724-tonyk-syscall_table-v1-1-9c53188423da@igalia.com>
 <3a481359-72d0-4c58-8a63-b6d941a22482@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <3a481359-72d0-4c58-8a63-b6d941a22482@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 24/07/2026 17:09, Arnd Bergmann escreveu:
> On Fri, Jul 24, 2026, at 22:00, André Almeida wrote:
>> To take advantage of the subset of syscall numbers that are guaranteed to
>> be shared, create a new table and adapt generation scripts to use it. In
>> that way, every new syscall can be added to a single file.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> 
> Thanks a lot for working on this, I had planned to do this myself
> for a while but had never quite gotten around to finish it.
> 
>> +#
>> +# syscall numbers shared by architectures
>> +
>> +442	common	mount_setattr			sys_mount_setattr
>> +443	common	quotactl_fd			sys_quotactl_fd
>> +444	common	landlock_create_ruleset		sys_landlock_create_ruleset
>> +445	common	landlock_add_rule		sys_landlock_add_rule
> 
> It should really be anything starting at 403, not just 442 and higher.
> 
> There are some trivial differences that have crept in over time,
> but we should be able to work around those.
> 

The thing that prevent me starting before 442 was how to deal with 
compat. If I add to the table

441	common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2

It will wrongly add

__SYSCALL_WITH_COMPAT(441, sys_epoll_pwait2, compat_sys_epoll_pwait2)

to arch/x86/include/generated/asm/syscalls_64.h.

Maybe I could add a --ignore-compat to scripts/syscalltbl.sh, and add 
this flag for 64 builds. What do you think?

>> index 22e34cd46b9b..77934a2d0f51 100755
>> --- a/scripts/syscallhdr.sh
>> +++ b/scripts/syscallhdr.sh
>> @@ -26,6 +26,7 @@ usage() {
>>   	echo >&2 "  --emit-nr          Emit the macro of the number of
>> syscalls (__NR_syscalls)"
>>   	echo >&2 "  --offset OFFSET    The offset of syscall numbers"
>>   	echo >&2 "  --prefix PREFIX    The prefix to the macro like
>> __NR_<PREFIX><NAME>"
>> +	echo >&2 "  --common-tbl       Use the common number table"
>>   	exit 1
> 
> Ideally we shouldn't even need this bit either, though it may
> help for the transition phase.
> 
>       Arnd

