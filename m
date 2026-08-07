Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A8542FCBB;
	Fri,  7 Aug 2026 20:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786135450; cv=none; b=H665zokMqZYpJN0gnYIXNQ3cJnQlRv9nba5wx/MZFOJ8QiGEjO54BAwtf8m2qcBo3xHg7l2bfeUJNOlLaHpMSPJOQcSgoRAL4j+bWK/nzD+Skf662bSz27rPr/uyNzoBDBWnu2rZaGPqew8irlhJpYG+09OIYJ3jBl81fQNGI7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786135450; c=relaxed/simple;
	bh=O61naHOYT5los+uexTGP8CBQPeVQXwT2jvQxGAJ0WwY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cbFix/GBFadlpny269BWMTs60kRWGcVv2jncTXH7rhdZL9kCfDNOjpCUMkAHRy3V4BKuejsox0oFGFyslhPE84nDh+cjxf2I/r3qLS8wHvyJxIBNKtfzymMFv65LgX6enClbtajgjcFJ/yZ843WqjbPnX9/4Wi/L0V6Vz8owsaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=lUUJn3Ir; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AyicHs02; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="lUUJn3Ir";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AyicHs02"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6C8767A00EB;
	Fri,  7 Aug 2026 16:44:04 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 07 Aug 2026 16:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786135443;
	 x=1786221843; bh=cCOokBWAf1HygwgwuTJm7+z+SkHIlbyC1b5WDlc1EeU=; b=
	lUUJn3Irn3tBuZG4iRDEv8e2S64iTt4NKYy/MF4e/dubU0D9uJcGiS7NCRE8jezy
	DLF5X12TuLuKCJzAS35FomVPrxK1D51Z4kav7mNZJuJ/+bVOuqSsuyvpwaEREskt
	7pjvL3jNPnpx5UhXejgVCEKoTLpXvE4Uon02Ovgy+YlOpJD77Wq4wusFLhkBZv/f
	B/pwY8wUZRB/Krypfq5Q77+3F9ofIK0eGZeBmp5M+BFW2Pa72q9FgwuC8u9aUOgc
	EBephN1DXzBrwbxanY9bhrAHYphkekQT2x2LLKp34kHK5VxGf0ssLmmv5CuS379z
	hMxsao/gsKllxMTR5VF7gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786135443; x=
	1786221843; bh=cCOokBWAf1HygwgwuTJm7+z+SkHIlbyC1b5WDlc1EeU=; b=A
	yicHs02Z8Qm6VU7gBvB4+zF5TbGDAn8G0fbxtHA2ZRqs7xWmzwk9aFrresdUcTHC
	L9Xb6fKqqlKSNEOWvc7TBxeGWwwYGwnj8GwN/7hqCu+KlZJthxWS1nwwwVrnc3Mw
	6rBnSADenMrWmqpJjN+V5Cn3nmi6wuJPYn/JlJ0Cbas+twY8hrKs64es9elnCMIS
	x8kIN4Gv4HaKmwk5E8U54PxNzRuD51x/QD98eIBVdlvOkNEzHYzxMhPRwev/cwzb
	IWQRkzDICdjXDhx9G9bPyh2U66aGgBiKTLWegWIvAHJXBfScHfHVC12q5T318eUj
	oRxOPUYRY5Ro/5QH6mmtA==
X-ME-Sender: <xms:j0N2aghcgrzu7XJXJ-dkhz-tfbG4p9McJ1RjogJhhb_AgASaBOW9Lg>
    <xme:j0N2aj0zHwV0svzoXjryPYSY5T1OMq-9fM0UTn1mEI5Rd8jgvbgOHgN-q5mYSrZXb
    XeLqgPcui2nmCtjxu4slogeBPdzV86BsmpJGtW1U_VOYk8xkg6mmx0>
X-ME-Proxy-Cause: dmFkZTGqBtENY+xO2Ij2MEcE/+s4sAJlTfeweCTNOE9/SC2lc/JTkHOmDsT/CbfhW/7Zee
    nPTqcpHDuU17SRiPU5fdbWL/7l4HrSTmd7AljLcWRfu98dJgWyffU/pkBGoLFGLvO5fPu5
    TStSMjc8HljxS8jz+uGbS6WZdzNG1VWz5Axh9emGllnS6XicQZaMjS6deJ6pfL6Vy3AI3F
    bKDbTaQQuUD6y+F3sOXlZnhthRjdLCDkiuhr5PzYL5nhioy8cm0w3aTs9gEUREdIB8Q9Uc
    4J6MpInpD8L6a5nkCbVnIrO5/P4SMeqa7v0Kj7NJFH4TRJtXCRO0NFOXTdeB3Db3Ki+FNh
    CFYY9E7fk/0iNQm3vUsqDL10whMOKwb+FzMmeFUC4vWq3QiUdrHRk8EQam/mMSXX3eG7wb
    yU+5EUdDJLgGWcZ8KFip7bHbgaMeagLuRbDDu0w6zhLRNWn4jgT2Dv0om66nSf+lCbCXqQ
    6OCEvsGILNss0zECbVIeROS+D3ASzwhLkyuOWEf+2iNvgPVDIJIlzV3zUHCdlzwsZT4Zq4
    /pPutdtmr3mjrITBEOBnE3ypDeR3/THh7SFbgR/1TVqksJzSL27R5cIcfaYXKTAZK+Ht5f
    8Ke+XUGnvEoQBdjOD09DRTszTy9sdh/O6sfxSGRMtF9DXGNR4HsCjFPJ9lFg
X-ME-Proxy: <xmx:kUN2amLUrAU81l25MZzKXm9mgRmW3-UEqEz7GyN7RVZ7SkBKyvH2Gw>
    <xmx:kUN2aoPZC8oBESHAIO6ID0zE4Lth83Vxytkm1kS-vAp3DnOmZ6sOpw>
    <xmx:kUN2ammqFT9pCpj3qyPNcygCSNRXBxD6rvo9yTtNRSTWbzeIyLxcGQ>
    <xmx:kUN2as7fiAhd0H9EeLAWZv0x-HgdaJIrQ91hqmFOMbvrxq0rnUMm0g>
    <xmx:k0N2asbfFmhzmwfhpKvxKDJ44kDW4ZNFgpxOPyQT4mOSUbpgLkc3sAuz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D69B132A0065; Fri,  7 Aug 2026 16:43:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Adr_s5Dpg-C7
Date: Fri, 07 Aug 2026 22:43:38 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <f9e24d57-6518-49f0-979e-9af8a57d77c5@app.fastmail.com>
In-Reply-To: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
References: <20260807-tonyk-syscall_table-v3-0-7c45a23c50b5@igalia.com>
Subject: Re: [PATCH RFC v3 0/8] syscalls: Add a shared table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026, at 21:34, Andr=C3=A9 Almeida wrote:
>
> There's already a "common" table shared with a bunch of archs at
> `scripts/syscall.tbl`, but due to historical reasons some archs will n=
ever be
> able to move to this table and share all the numbers.
>
> The generic table starts from 403 (clock_gettime64), the first common =
syscall.
>
> I've compile tested for arm32, arm64, s390, mips and sparc, by compari=
ng the
> syscalls_*.h and unistd_*.h files generated before and after this patc=
hset. For
> most of cases the files are identical, for the few cases that they are=
 not,
> there's a note in the commit explaining why they are equivalent.

Any reason you still didn't include the alpha version? As I mentioned
before, I think this is the most important one to be in the initial
set, to ensure the script can deal with the having two separate offsets
without becoming too messy, or needing a rewrite to take multiple passes.

      Arnd
