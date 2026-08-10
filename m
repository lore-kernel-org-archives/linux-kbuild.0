Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEC03DC4CD;
	Mon, 10 Aug 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368362; cv=none; b=UjAVeUD48VWdaKkd7Rmp64ApQKDHH/GyrhJMzVCOnAgOr8GpkZHNNP+kgOEhuDJ0zzje+65U3BJUN/GP7CAvgBBjWi+R51lRaR2UX9OK9Wx3niI2xLZcmqCi5W0Dr7zrf9K+3eULriLqc6qad9BoJrHek9JXkWZtJ8U/5IfuW3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368362; c=relaxed/simple;
	bh=bw2cn3L5y7n6qpyV75PJcMT0LkRbHrktypkpfINjK1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EjfkjOus5EwX59Sa3RfSLSCUgqftSzUua7AmfCOhzl7xNPsZRIUBLhgbot63Xlns0Csf0Qtwl/LgYI46YVekJOQcXNeUxO/b3ov9FqXu+0RPTIR1igh8v/VpkpZXALScWpjxbZkJtU9uc080z2sUSAfdjzsUWsoXeGDwtyrLFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Vb4fe0zf; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Vb4fe0zf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=57fagsk/cjjgNsXqGrUsNjYH5DDEaXm25e/BKJ2QRXw=; b=Vb4fe0zfGzU96hBWIpb9yaFE/q
	UqskE/gqG44o5QmW0Ou75Wj9riJYOjNgglOebFpc5z47l/lBTO7N0c3LSqUiU4GPHVYcKCmSv8zC6
	XCksDHshpOLkwgQK0oFfHXBSPIzaemrpSWgbx9UFDwT02byKgMNV7sidYUaLbDqQRG1/rF0+UIIh0
	OZOBmxJvXfYlXqa5CJSXKuKTJLVvY8/RINf41IPO13dzCtEW0e999uukUHDNv2yg/7K4SQuJHQ8Eq
	728p571Llwgxqq2h0xuj7J2tVnZPbMjtyZTkLE+M6grI+rqaE1001ykbJNEjCWGVxbPbVOMZEWA6c
	baZreShQ==;
Received: from [179.118.190.92] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wtQ0r-00GbUq-9g; Mon, 10 Aug 2026 15:25:57 +0200
Message-ID: <52ad6a69-3623-4013-aeb6-60b6be88a4ff@igalia.com>
Date: Mon, 10 Aug 2026 10:25:56 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/8] syscalls: Add a shared table for all archs
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
 <f9e24d57-6518-49f0-979e-9af8a57d77c5@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <f9e24d57-6518-49f0-979e-9af8a57d77c5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 07/08/2026 17:43, Arnd Bergmann escreveu:
> On Fri, Aug 7, 2026, at 21:34, André Almeida wrote:
>>
>> There's already a "common" table shared with a bunch of archs at
>> `scripts/syscall.tbl`, but due to historical reasons some archs will never be
>> able to move to this table and share all the numbers.
>>
>> The generic table starts from 403 (clock_gettime64), the first common syscall.
>>
>> I've compile tested for arm32, arm64, s390, mips and sparc, by comparing the
>> syscalls_*.h and unistd_*.h files generated before and after this patchset. For
>> most of cases the files are identical, for the few cases that they are not,
>> there's a note in the commit explaining why they are equivalent.
> 
> Any reason you still didn't include the alpha version? As I mentioned
> before, I think this is the most important one to be in the initial
> set, to ensure the script can deal with the having two separate offsets
> without becoming too messy, or needing a rewrite to take multiple passes.
> 
>        Arnd


One reason that I didn't include alpha on this version yet (but forgot 
to explain in the cover letter) is that alpha is the only arch that 
doesn't implement `set_mempolicy_home_node`, and the commit message that 
creates this syscall doesn't help to explain why. But for now I think I 
can do something similar to `memfd_secret` and add a new ABI or use the 
stub implementation.
