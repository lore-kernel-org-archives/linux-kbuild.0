Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF03F65F9;
	Fri, 24 Jul 2026 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928240; cv=none; b=TpznjYBB2EdP4xAH3mVQHRamfB2raHJM/WmdlFTjEGRrJFenXg7LZLRsxvxu96kPn9Vs/+NzfycBLt8+/SKKNAu5TT2VO4/3LDFbY3CI7mC3dVqurfp4ck4kTKrxPMqfH+dsz7TVO5AP5PGx1bKERy2jfiOvw4hN3+tWxMPOTPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928240; c=relaxed/simple;
	bh=34C34DS8/psFfyJMB5KdPvGx5x76v2aM9rn05YHny1w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=H9sGx6FMIQvbdHVtEJki1v9m6xCz+Gx3M2wZtzIuS0TdWE68O9gr2KkElnVbKbRyPbXdQWdE9hfFm7rtSbjtvUI+jms1kFIlWFlG/tjJylti4f/15Xp1vzFI+2w2N7aFAE81b0Qal7gWsvPvGGZJgD/nJIscUd2MC5ZcG2EkmNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=TdFbuVfS; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="TdFbuVfS"
Received: from ehlo.thunderbird.net ([172.56.212.127])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66OLN85o1867666
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 24 Jul 2026 14:23:09 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66OLN85o1867666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784928191;
	bh=H/ueH0EHMUSzJlRXLumgyRNWg6QnHE9ksLC5InX7/JY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TdFbuVfSqlE/FLdYUG4Wga+ei2I5Ygx+o8J32Q/f5485ulS4OOFlhyTgXpTs1+I8a
	 SJOM+BN+wWdjbSyxlWyDpoaAg71Z7J87z5QLRZKwtPIbJrNzYHsREu/Qa/uzLTzIad
	 zBXKRnRkEH5JpjwChDHCWngJkEp8vJk1kkUa0xzmPktmvUY0d6qc7XYQ6lRjYQUAZM
	 ZVgUuAS9jHXwhjoWEj4ymDOpdjo7JgxD4kp4SIrZ3xonPHtFbYTGPZh9Fd32rr0b5o
	 cEI9nB3CNhWcR6q5btkfn6eebnDM4bfLgn7wvlDJTFfz0CbLStKvM4/upWUpFoJpda
	 ZcLCmoEsmDB0A==
Date: Fri, 24 Jul 2026 14:22:44 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>,
        =?ISO-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-dev@igalia.com, Thomas Gleixner <tglx@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_1/4=5D_syscalls=3A_Create?=
 =?US-ASCII?Q?_unified_partial_table_for_all_archs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <8550e179-3905-4275-afff-c19990a329ab@app.fastmail.com>
References: <20260724-tonyk-syscall_table-v1-0-9c53188423da@igalia.com> <20260724-tonyk-syscall_table-v1-1-9c53188423da@igalia.com> <3a481359-72d0-4c58-8a63-b6d941a22482@app.fastmail.com> <9a9caecf-5d72-4c68-ad46-5779c3fb73f0@igalia.com> <8550e179-3905-4275-afff-c19990a329ab@app.fastmail.com>
Message-ID: <D43E56E4-209C-4E77-97EA-C62DE6D7BBC2@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 24, 2026 1:25:05 PM PDT, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Fri, Jul 24, 2026, at 22:18, Andr=C3=A9 Almeida wrote:
>> Em 24/07/2026 17:09, Arnd Bergmann escreveu:
>>> On Fri, Jul 24, 2026, at 22:00, Andr=C3=A9 Almeida wrote:
>>> It should really be anything starting at 403, not just 442 and higher=
=2E
>>>=20
>>> There are some trivial differences that have crept in over time,
>>> but we should be able to work around those=2E
>>>=20
>>
>> The thing that prevent me starting before 442 was how to deal with=20
>> compat=2E If I add to the table
>>
>> 441	common	epoll_pwait2		sys_epoll_pwait2		compat_sys_epoll_pwait2
>>
>> It will wrongly add
>>
>> __SYSCALL_WITH_COMPAT(441, sys_epoll_pwait2, compat_sys_epoll_pwait2)
>>
>> to arch/x86/include/generated/asm/syscalls_64=2Eh=2E
>>
>> Maybe I could add a --ignore-compat to scripts/syscalltbl=2Esh, and add=
=20
>> this flag for 64 builds=2E What do you think?
>
>IIRC, we can just use compat_sys_epoll_pwait2 for both i386
>and x32, because compat_sigset_t is compatible with sigset_t --
>they are only really different on big-endian targets, which
>count the bits in a u64 different from two u32=2E
>
>This problem also goes away once x32 is gone=2E
>
>      Arnd
>

No reason to introduce another entry point if there's no difference=2E=20

x86, after all, is littleendian and alignment-tolerant=2E
