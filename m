Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1553299959;
	Wed, 29 Jul 2026 01:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289527; cv=none; b=OMWgBwdmyXuuILfzVxAG37IZXY8SQj1wR55xBN2d1zIRTRvE8L5Y9cyMNAKuIiL+4dsUeiIMZcmvGPIDjgo8QYSdGmIc+2VmnU2Ks+r2gTwL1C2aMNCljv7RasURN37vxteWJpnGNwBUe+aCAoq51iIXU7FyfUvZNJ0Ps/ZxAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289527; c=relaxed/simple;
	bh=URKkulmq+3LoIFumexvYQSaHNxWZ2m0n0A3pd8IL5HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GCobMTo5XmA5TORV8zmtaViKBsISIkNNaOUAqPpwHOAsw9S00YOQA602u459sBUSe+fWL7BjOHzUEbtuUdQ4RArVHOh920TCyVJpWZahzEKMIl5QW7aYicxqFH4zwgdNnrkZLEsDug0ApG/d3r8dRXwBKoeEc73vLJve4lkXwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=R86ZVHnw; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="R86ZVHnw"
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.102])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id C9C6920097;
	Wed, 29 Jul 2026 01:45:17 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id C70733EBDF;
	Wed, 29 Jul 2026 01:45:09 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id A10B0400E2;
	Wed, 29 Jul 2026 01:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1785289508; bh=URKkulmq+3LoIFumexvYQSaHNxWZ2m0n0A3pd8IL5HQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R86ZVHnw+R6A6OnsruELdijbWLa8HwOJlqtIVNc9cPzEtTIWEiUOHG4sMyV5RhUGJ
	 wkzbbt771lJo0y903dXWkB3Z8UB4xfbKlyUKuzvFdquYV9sTP9EKn51QtdAvI+Vqql
	 l1kBotqOXI36HYHGeTPHW7T3z70eI1XEl1bYyMas=
Received: from [198.18.0.1] (unknown [64.118.149.242])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 74A0640AA7;
	Wed, 29 Jul 2026 01:44:59 +0000 (UTC)
Message-ID: <ca5671ba-21f7-4cdd-8a1f-d0b4fd310789@aosc.io>
Date: Wed, 29 Jul 2026 09:44:50 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/boot: use zstd -19 if building for 32-bit
To: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
Cc: Kexy Biscuit <kexybiscuit@aosc.io>, Xi Ruoyao <xry111@xry111.site>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>,
 Jan Stancek <jstancek@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Simon Glass <sjg@chromium.org>, Marco Elver <elver@google.com>,
 linux-kbuild@vger.kernel.org
References: <20260728143141.2870515-1-jeffbai@aosc.io>
 <f833d263-9f47-454e-bc64-818ac42d63dd@app.fastmail.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <f833d263-9f47-454e-bc64-818ac42d63dd@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.30 / 10.00];
	R_SPF_ALLOW(-0.10)[+mx];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	DKIM_TRACE(0.00)[aosc.io:+]
X-Rspamd-Queue-Id: A10B0400E2
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action

Hi Ard,

在 2026/7/28 23:58, Ard Biesheuvel 写道:
> 
> 
> On Tue, 28 Jul 2026, at 17:31, Mingcong Bai wrote:
>> When using native build environments (that is, 32-bit x86 chroot/container
>> as build environment for 32-bit x86 binaries), `zstd -22' requests more
>> virtual memory than that could be allowed on 32-bit hosts.
>>
>> Introduce `cmd_zstd_with_size' for CONFIG_X86_32 builds.
>>
>> This is quite possibly just stupid... But there doesn't seem to be a way
>> to detect the host environment. So I'm sending this patch as a means to
>> ask for your opinions.
>>
>> Any help would be greated appreciated.
>>
>> Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
>> ---
>>   arch/x86/boot/compressed/Makefile | 5 +++++
>>   scripts/Makefile.lib              | 3 +++
>>   2 files changed, 8 insertions(+)
>>
> 
> Doesn't this mean ZSTD -22 is generally broken on 32-bit? How is this
> specific to the kernel?
It's not (and remains unresolved)[1] - as I mentioned in the email, I 
sent this patch out as a means to spark some discussion on how to 
approach this problem.

Nick Terrel mentioned in commit 48f7ddf785af ("init: Add support for 
zstd compressed kernel") that "zstd22 is used for kernel compression 
because it is decompressed in a single pass, so zstd doesn't need to 
allocate a window buffer." But I wonder if it resulted in tangible 
change in compression ratio - but I can do more testing.

[1]: https://github.com/facebook/zstd/issues/1964

Best Regards,
Mingcong Bai
