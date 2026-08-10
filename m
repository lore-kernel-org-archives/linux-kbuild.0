Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D1C3B14DE;
	Mon, 10 Aug 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368036; cv=none; b=mvjGD88hnYFoJZ85XWtwtcdEFbx81C/xsX5DPevV/pOiMUNczuloCWZkknew9xDQj4ZNjV9FaGW6nHD3+r1dSI/2b01yjGij4e0lr4m4jxCiJtQD5E+MHjBUt8t3pU31O6QyP1obe49n5d5zjSLEtdlqTyL2AZHPuEgOQQ0yK98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368036; c=relaxed/simple;
	bh=H151jOanAXRCSmHjX5jkRy4c4DTXmfOPwreCAmwqVAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CwIok5ib6iJ0fhZ2TZo/rZHeDguWY12pFtuvbWCCajY2h6jdiD+nIDIiePizJ8V9brXcx7Qg4kO/boINpdXMWRnl3JJGoPgoyIZ/wESdeIDRVcDoubJCOE972Txoh6lP4qYrk2plXhQlc+2dq7wwBzsaj7KrMB7Fi5/HDL8oznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RBvTyth7; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RBvTyth7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=TcIAGiaeDLHK/LwBcOdviPDYoOT+e7UOiDgngUzsgAE=; b=RBvTyth7kFnTnh/fWoTVrq1CX4
	Zo4ZgDpFHLlIFBiH9xw2+N6KY9ve94wQ+CrwVaVt0hDDw1pBWvXleyP+2SeMl5ZL+pEbO6Ey42h62
	52ypSb+vmTT7lN8JqwrtGeGLwhIcPPM5ypK1cagwLUIj4VhJioX+yb5uS2DV+Vu91opzQBOg/21mQ
	NOe8a9A3B0E5cj/h0JjnqPyi5zL8mkRziuBwxRAw+zL9W8/Z7KT0uMCkj5ECdoW06/pcDE5FMTKQS
	irF4I1eFNmTEZx9SWSek0j4S0Msp54QsEckPkMfvfL/O2yEm8SQF4vquOZA0BWYWa1vyrilVQ4qZ5
	ukKhSVIQ==;
Received: from [179.118.190.92] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wtPvb-00GbO3-9K; Mon, 10 Aug 2026 15:20:31 +0200
Message-ID: <cac9327a-25f9-4a56-8aea-e9eda7f1c76a@igalia.com>
Date: Mon, 10 Aug 2026 10:20:30 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 8/8] mips: Use the common syscall table
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, linux-kbuild@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, kernel-dev@igalia.com
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
 <20260807-tonyk-syscall_table-v3-8-7c45a23c50b5@igalia.com>
 <772d5c6a-d080-4bff-acbd-5021d93ca2d7@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <772d5c6a-d080-4bff-acbd-5021d93ca2d7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 07/08/2026 18:02, Arnd Bergmann escreveu:
> On Fri, Aug 7, 2026, at 21:34, André Almeida wrote:
>> Syscall numbers from 403 are shared with all architectures, so move the
>> toolchain to use the common syscall table and remove duplicated code.
>>
>> The generated files are not exactly the same as before, but they have no
>> functional changes:
>>
>>   - for O32 ABI, the syscall table would have entries like
>>   __SYSCALL_WITH_COMPAT(403, sys_clock_gettime, sys_clock_gettime)
>>   which is equivalent to the new entry __SYSCALL(403, sys_clock_gettime)
>>
>>   - for N32 ABI, the syscall table would have entries like
>>   __SYSCALL(413, compat_sys_pselect6_time64), which is equivalent to
>>   __SYSCALL_WITH_COMPAT(413, sys_pselect6, compat_sys_pselect6_time64)
>>   given the new __SYSCALL_WITH_COMPAT() definition for N32.
>>
>> The generated syscall table for N64 is exactly the same.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   arch/mips/kernel/scall64-n32.S            |  1 +
>>   arch/mips/kernel/syscalls/Makefile        | 22 +++++++---
>>   arch/mips/kernel/syscalls/syscall_n32.tbl | 68 -------------------------------
>>   arch/mips/kernel/syscalls/syscall_n64.tbl | 48 ----------------------
>>   arch/mips/kernel/syscalls/syscall_o32.tbl | 68 -------------------------------
>>   5 files changed, 18 insertions(+), 189 deletions(-)
> 
> I still wonder whether we should combine the n32 and n64 tables
> here. Since the script can now deal with multiple input files,
> the first 211 syscall numbers can be in a shared file, while
> numbers 212 through 332 are always going to be different.
> 
> Alternatively, two the files could just be merged into one file
> like
> 
> 0       common    read                       sys_read
> 1       common    write                      sys_write
> ...
> 13      common    rt_sigaction                sys_rt_sigaction     compat_sys_rt_sigaction
> ...
> 210     common    remap_file_pages           sys_remap_file_pages
> 211     common    rt_sigreturn               sys_rt_sigreturn
> ...
> 212     32        fcntl64                       compat_sys_fcntl64
> 213     32        set_tid_address               sys_set_tid_address
> ...
> 212     64        set_tid_address               sys_set_tid_address
> 213     64        restart_syscall               sys_restart_syscall
> 
>   
>> -$(kapi)/unistd_nr_%.h: $(src)/syscall_%.tbl $(sysnr) FORCE
>> +abis := common,__cln3
>> +
>> +abis_n32 := $(abis),32,n32
>> +abis_o32 := $(abis),32,o32
>> +abis_n64 := $(abis),64,n64
> 
> We should probably drop the custom ABI names here and just use
> common/32/64 in the .tbl file. There was never a real need for
> the special case here, and now it causes extra complexity.
> 
Ok! I like this ideas, I will prepare it for v4
