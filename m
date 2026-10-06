Received: from mta0.migadu.com (out-151.mta0.migadu.com [91.218.175.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0130E82B
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Oct 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791315598; cv=none; b=n/9H3m9fAQQH1Rt8wMr8bktEFWG4i8BzTw3tBBrQSqnkFOWfdrwEs74ETPfJESdJzPhnkY5PXNS4nI+bSi7JesNv4wx0wvsyZ5b8Fzy7tPnW587Ve6jPFXF+MnrJY5fX/hx3zPwrKLG75bS6XFhq7aX8i2rW+UVKZIUhFWo3zuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791315598; c=relaxed/simple;
	bh=xP63sy4/U4IIXsGIADVZOzp4QOvB9j1mBsJ666v3MhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAOo2Vob5kiTHGgt55jwMXZLpZEJ1X/NrKRmk0SAg9bm8x5m9hAeEDB3cAunuYJeNNV1FWiTEutSDNFCfItl4uBYV7/0JKAz0QZnQWN61j6lw+9ceKCl1DcJrEM+p0PF/fwMhDQPYvegUAHdliYEIwLix/ZeSB4gUBAmflIZtpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sRmum6xb; arc=none smtp.client-ip=91.218.175.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sRmum6xb"
X-Envelope-To: linux-kbuild@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xP63sy4/U4IIXsGIADVZOzp4QOvB9j1mBsJ666v3MhU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791315592; v=1; x=1791920392;
 b=sRmum6xbERW5OypsEBvYk5Z1c+hpj5pQ0hqLgzg6dKD0KTEIVVgCoEmzVqEJ8W/NFRyVjwzv
 bcYvQ8IvOsxdFNIrD5zRnElMcTbHczIXRvGn1qdWrlO6t1hNP/fmDTMmaxgW0r3Le4oCvZ3cJsz
 ZknBmFFbuKXBlVt05ZhsQ3MY=
X-Envelope-To: linux-kbuild@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bb51a2f96e6988cd;
	Tue, 06 Oct 2026 19:39:52 +0000
X-Mizu-Trace-ID: bb51a2f96e6988cd
X-Migadu-Flow: FLOW_OUT
Message-ID: <0cbe9bb2-69b5-4d6c-a780-07a55d40a63d@linux.dev>
Date: Tue, 6 Oct 2026 21:39:51 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: install-extmod-build: install
 kernel/kallsyms_internal.h
To: Nathan Chancellor <nathan@kernel.org>, Jim Cromie <jim.cromie@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, nsc@kernel.org,
 thomas.weissschuh@linutronix.de, chewi@gentoo.org, abelvesa@kernel.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
References: <20261005200123.146822-1-denis.benato@linux.dev>
 <20261006081116.GA830598@ax162>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261006081116.GA830598@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/6/26 10:11, Nathan Chancellor wrote:
> Hi Denis,
>
> On Mon, Oct 05, 2026 at 08:01:23PM +0000, Denis Benato wrote:
>> The tree staged by install-extmod-build contains no kernel/ files, but
>> since commit 4fafd1165b33 ("kallsyms: increase marker density to 16:1
>> to accelerate lookups") scripts/kallsyms.c includes
>> ../kernel/kallsyms_internal.h.
> You did not add either the author or the committer of 4fafd1165b33, I
> have done so now. This would need to be handled by them. However...

Hello Nathan,

Apologies. I used whatever came back from get_maintainers.pl without
much thinking given this is not the area of kernel I lurk in, but thanks
for taking care of that.


>> install-extmod-build rebuilds the host programs inside the staged tree
>> whenever CC differs from HOSTCC (cross builds, or a ccache-wrapped CC).
>> scripts/kallsyms is hostprogs-always-y, so that rebuild fails with:
>>
>>   scripts/kallsyms.c:39:10: fatal error: '../kernel/kallsyms_internal.h' file not found
>>      39 | #include "../kernel/kallsyms_internal.h"
>>         |          ^~~~~~~
> I would rather not ship an internal kernel header in the external module
> build. If these defines are needed to build scripts/kallsyms.c, they
> should live in a separate header that is included in
> {kernel,scripts}/kallsyms.c that is safe to expose to the external
> module build but I defer to the 4fafd1165b33 folks.

Fair. This is something I spotted compiling our training/testing kernel
at OGC using the github CI and my main goal was raising awareness
on this issue so I simply started that by sending whatever glm did
to make it build ahah.

Please when something better comes up CC me as well so I can use
the proper fix rather than this llm-cooked thing :)

Best regards,
Denis Benato

>> Stage the header so the linux-headers-* and kernel-devel style packages
>> can rebuild scripts/kallsyms.
>>
>> Fixes: 4fafd1165b33 ("kallsyms: increase marker density to 16:1 to accelerate lookups")
>> Assisted-by: ZCode:glm-5.3
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>>  scripts/package/install-extmod-build | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
>> index f12e1ffe409eb..aad2cd59a37ba 100755
>> --- a/scripts/package/install-extmod-build
>> +++ b/scripts/package/install-extmod-build
>> @@ -20,6 +20,8 @@ mkdir -p "${destdir}"
>>  (
>>  	cd "${srctree}"
>>  	echo Makefile
>> +	# scripts/kallsyms.c includes this header
>> +	echo kernel/kallsyms_internal.h
>>  	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
>>  	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
>>  	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
>> -- 
>> 2.47.3
>>
