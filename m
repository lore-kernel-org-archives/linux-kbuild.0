Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1569C3B71D8;
	Tue, 28 Jul 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221277; cv=none; b=R5jDtiX1T6KgcB02c4fRrl/buBQ4+uc2FxM5nseVy13kMwA6GRF1G3TnuBGYVfacl9jbKJqphgCrRvd1+alnbpxEDYyO5A0j6fA+9PqH45ysdSfUy5qjIlz903H4Hl0x2DIyHdLCMrXmgqduK277rTI2mpuq7sDRScdu0xE1wCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221277; c=relaxed/simple;
	bh=jL1HNMpPt/GO3liJ24E58urnwtF1g3pDEJDCdT2S8DA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tUXW9ZIn+i0kXUTnC1NCGuRRITyY6bdJRSbwUqRnmkWiHiUpYaFbFGZJ7oSB88D5+gvFe5ExgFVxasKLE5uX5SXIqUPbUtMel4Akcy8i5g4ncYunAzbGX5JR2jq2d9NJ6ItPiS04KTFzh4Gtz4i3eMTFWbftccYHGjW0jvWFBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ZKn7BQvN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JLXtEnpN; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ZKn7BQvN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JLXtEnpN"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 0F83BEC001B;
	Tue, 28 Jul 2026 02:47:54 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 28 Jul 2026 02:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785221274;
	 x=1785307674; bh=jTrQIT2U8agEh1+MZm0yljI85ghxytmZiTqziruUcx4=; b=
	ZKn7BQvNzgfpLb8/QmPPyh2aloURbjIdz2l8GRiUBkIfOoJzPJLkpyW4YPgm3XEW
	e4hKQzIwOZHMiRuVSbVzWY9yRXUxHhQMUagj0a6CG5ysY8mc5x/B46dMsnIyL530
	FpmFGll0012R4Z3FR+9suDjXLkPcosgMvG8CtFFSskKxzZTwXrOo9oclG3m1sPW+
	thYu9UePC4tLj9Uyz9Qkt2hjSJXx0V5gjlc1+urkeRtIBVEN9Fldlh/4PGpishKH
	7I1t/s5twy9sxAI3QWivzgMh95Q6dkMVjXbsezlkdwt1n2AgUjy2I/3ysxj0I9Aj
	v5l9MLuGjcF6e11Xkf/XsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785221274; x=
	1785307674; bh=jTrQIT2U8agEh1+MZm0yljI85ghxytmZiTqziruUcx4=; b=J
	LXtEnpNhJQiAUj//LIEAuYsS0ToJfLiENcXWpybngZj46c4KzvzCMMkOkhL286bP
	lEKylNjAZjTtQtagVQlZ5+pyjjeq4p1tk20JIQ1nTqKLbHzwzunkjJifQDV0KV+D
	I2qaaIDzuXtP0AG2q/fYiHtwDR7CZ49Oc7oAWYOQRvGo1/9uqCcUJ6TnsxQgEjvz
	ABUH0gWuBVGEr0HATC4mMAU+va4qnFbNYGdTnIYZFjF2HKetHcymD/+B3jm7eoQ0
	3CX7kV1fF5RODA4YKQv2D8uH/NWa43ARqUOBWYtCbawrBCrP8XDq1dTPxzUY3/jN
	JI0P3C6XHtD+e/V9EWBqQ==
X-ME-Sender: <xms:mFBoavzfEEcOkUEIwTlJ0PpjTaQtxuQoM5zXbvDrnNsmSTEViM9oAA>
    <xme:mFBoaiGaSkv4YwV0_BWiIuLXl8VZuShYxoj_K0SvpnVyzL-SsCNp8mK30tgnON3sF
    UAGxiLjd7EL8bj0ZTSBRh1NcFkG9EHhAkyDjkRsneT7NkLw0mciWtM>
X-ME-Proxy-Cause: dmFkZTEjoCVHaVjPXuzYKRValcescawsEq0DteW7bQchJ3/qpPslBVDXzh9z1hcsCXO1I1
    iekoN9/2A2ADqBRUkJRPVrOJf9ogXtzGnZ2aIeqaxKmBAesU4kk+gMkwSrOcayX1TbK/4+
    /M4oHiJyCO0MDl/xHBfenG3CkTk10yqUiYN3VAFvfVYkU1rZVz3yd7cd44nSJGSzoEvw4s
    TmXWZrSHxJghiYKcS6NGAIXwlVvtxLa+tHQ5FZOr8VDymAwsP55O+vQHkyk7/KK7SDP73e
    Kh76Xu7b3Qoa3PC6nYEHcjRAn/kWKp1gD9RK+0AzqWTrPwcjRl2QdxArjTI7If8F0raQH2
    8SEn+xnUl8QXYvu0VcM02yr7llR482fMx2krje6evb0Kef5Uu6tc63hqSllYVwOEW2F77F
    Bt38XGTQ1/BQBpPUTOr1vvSHqF8C/HQmUNWRJLeb+G5PI0kgze6UZPOQpUFgUzLaj6szvv
    bk6rp4DDoOg7F3ZSq5mJPQ4crvCE9+Wj7jey8+fJxdDhpjvTNlEE8PCljkmCsWlnL9iJOq
    CaC844OaY4n1AAq4bPsGreaRGBFDzmWvUDohwM37b7ONu2LdanxgHCW4tIpSyzABukQ7b7
    X8eeD3mIvDmgZHWhZXVVJ1t73+RJnOq7vXTCTtBuy87Q/V28iE9cwWjxgO+w
X-ME-Proxy: <xmx:mFBoavU_Yghwq5OMH_6sucyD_h1UMGHR9gJk6AHRglZ-_672E5Fe0g>
    <xmx:mFBoavxpmQW3fGSj6PlnXsiDTYQHXAx6mK6OuDxva_WM_liZmMmqDw>
    <xmx:mFBoam9KVf0imbbRwoArz1jo60unXVm2LSqE9a-uLsq2FezgHdBi-A>
    <xmx:mFBoak_x_MDSdRT-XLu48KJSB6ItKgpuPDS7NIxpWQQccexnWvVN0g>
    <xmx:mlBoamHagtu53e8KPMtj_0eqy-_EnO7yVrftkwtCzu0nzwgvMU0qMGnW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A44B7182007E; Tue, 28 Jul 2026 02:47:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AAUiJyq0JrqF
Date: Tue, 28 Jul 2026 08:47:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernel-dev@igalia.com
Message-Id: <7ada7223-3fd5-4637-95c8-d24165d0b7bb@app.fastmail.com>
In-Reply-To: <20260727-tonyk-syscall_table-v2-1-95d4f1ee471f@igalia.com>
References: <20260727-tonyk-syscall_table-v2-0-95d4f1ee471f@igalia.com>
 <20260727-tonyk-syscall_table-v2-1-95d4f1ee471f@igalia.com>
Subject: Re: [PATCH RFC v2 1/4] syscalls: Create unified partial table for all archs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026, at 04:47, Andr=C3=A9 Almeida wrote:

>  	echo >&2 "options:"
>  	echo >&2 "  --abis ABIS        ABI(s) to handle (By default, all=20
> lines are handled)"
> +	echo >&2 "  --common-tbl       Use the common syscall number table"
> +	echo >&2 "  --no-compat        Don't generated the compat version"
>  	exit 1

You don't explain what the --no-compat flag is good for.

I would hope we can avoid adding even more flags here since
there may be other (external) scripts that process the same data=20
and that need to stay in sync.

> +COMMON_TBL_PATH=3D"../scripts/syscall_common.tbl"

Hardcoding the path here means the script can no longer work
outside of the kernel tree.  Maybe you can you combine this with
the --common-tbl argument to pass the file name?

     Arnd
