Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8B3DC4CD;
	Mon, 10 Aug 2026 13:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367971; cv=none; b=c+YMMlOHo6slGaWA3X/K7EGBEaIazm5YqfuZcQ6T/o3OyOdz8mYU5cK6aGNhkKf4tFQ+MAyy1474Gs4YRIZd155deHB+rM53DPsxRdV6su3yVxhm1C65rydjknDOexBqEqgA1EDDmDQwT8FGpgBb+Jha5n1iQB+K7hFgZQqqkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367971; c=relaxed/simple;
	bh=bvxec+HOf4NpO7ObHrQwXh9yD0N3VL2pMqm/9I9MkTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1a66A4CVXqEC2LwekGzUYys2XTVjmAJwUT3LbDMQ2ygoCk3HOChVxmtz3hv4T9rzzN9f5anu/1vUzUO2nNzivjKCcDHpeb3czYAXOYueNDKMAhWtmEqiQedt5+uCrJa5ih41Iq1ZevYiYRALIsQQYW8UTBjmm+bhiTz2uPVkpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=TeQClYvt; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="TeQClYvt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=i7Vk+WZyhYml/oqXvC0ojS0hIvc0X/CBUrzfBHLQ43M=; b=TeQClYvtBbv2hzod8xpBvWdLRQ
	6c5ioa0dlqxBYnC/vfvuQs3sMZ3Qh+GAgdr3lumT/aHiJ08SREOJlKPssUBnj+vN/o+zP1Mj6bJua
	mlQ6G0WlvlYRAzzbjexM70fZE97zV8LDN4SR7IjqxUEy1PMN54vKB3DDMgQoMOLn4idu7Tee2V2NI
	Pu2K0xb5HZqnKo3x8Chg6KuofcMdtNfovSWVANXnt0t3InBOpoO2C6P+XOvZ0KSpW0PRhwE6TiekY
	QjEvlM/mt5O6bFQjiJg5IMXSJR/5eZ06FgVn2XnddDa0cfEdlNLhIbN+Hfpa1QpT/w+7vGUnptKw6
	sh7KMZEA==;
Received: from [179.118.190.92] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wtPuV-00GbM0-OR; Mon, 10 Aug 2026 15:19:23 +0200
Message-ID: <099046ab-ca4d-4a1e-97ad-e2fe05b9e81b@igalia.com>
Date: Mon, 10 Aug 2026 10:19:21 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 2/8] syscalls: Create unified partial table for all
 archs
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
 <20260807-tonyk-syscall_table-v3-2-7c45a23c50b5@igalia.com>
 <fc9361d7-2505-4ec7-9d47-966b4f5a9fc2@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <fc9361d7-2505-4ec7-9d47-966b4f5a9fc2@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 07/08/2026 17:40, Arnd Bergmann escreveu:
> On Fri, Aug 7, 2026, at 21:34, André Almeida wrote:
>> To take advantage of the subset of syscall numbers that are guaranteed to
>> be shared, create a new table and adapt generation scripts to use it. In
>> that way, every new syscall can be added to a single file.
>>
>> Create special ABIs in order to make the table work for different archs:
>>
>>   - `memfd_secret` for archs that implements it
> 
> This was already there, so it's not really a new addition. We could
> also avoid this entirely and just rely on the stub implementation
> from kernel/sys_ni.c for those architectures that don't need it.
> They still get the macro definition, but it should be fine to define
> that for everyone.
> 
>>   - `cln3` for archs that use the common clone3 entry
>>   - `__cln3` for archs that use their own special entry point
> 
> I guess that's one way to do it. I would probably use the full
> clone3/__clone3 name here for consistency.
> 
>> Some archs only care about the native entry point and have no compat, so
>> create a option to never generate __SYSCALL_WITH_COMPAT() and always
>> generate __SYSCALL().
> 
> I don't see the purpose of this and would prefer to not add that
> extra option if the scripts works fine without it.
> 

Some archs don't define __SYSCALL_WITH_COMPAT() (see x86_64 for 
instance), so that's why I have added this option. But I can define 
__SYSCALL_WITH_COMPAT() as SYSCALL(nr, native) for those archs.

>>   usage() {
>> -	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET]
>> [--prefix PREFIX] INFILE OUTFILE" >&2
>> +	echo >&2 "usage: $0 [--abis ABIS] [--emit-nr] [--offset OFFSET]
>> [--prefix PREFIX] [--common-tbl] INFILE OUTFILE" >&2
> 
> This needs to be changed to include the argument of common-tbl
> 
>> diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
>> index c4b1f85c2dd6..c0fd6af2d892 100755
>> --- a/scripts/syscalltbl.sh
>> +++ b/scripts/syscalltbl.sh
>> @@ -16,18 +16,23 @@
>>   set -e
>>
>>   usage() {
>> -	echo >&2 "usage: $0 [--abis ABIS] INFILE OUTFILE" >&2
>> +	echo >&2 "usage: $0 [--abis ABIS] [--common-tbl] [--no-compat] INFILE
> 
> same here
> 
>       Arnd

