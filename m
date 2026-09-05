Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B98633936B
	for <linux-kbuild@vger.kernel.org>; Sat,  5 Sep 2026 15:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620587; cv=none; b=W6/3a+4AiEir0EPgVeD/Iz+tKOgG4D5HdzIMsdA9tCpSt2m4gYBQrg87t6/F+ig1ME5o9/avhGTq08txZqJsTY5em3ZDLGgyyzss3LZ7D5caTi5qRsb2xkNdP44Jk61Wu+gqe2+Z+8yDp8x/UUyKWnTYCat2YQ2oldlnrxTJotM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620587; c=relaxed/simple;
	bh=ix2jsdPytUfBxhlQ03yeIyNNme19gAi4Ev5xrjI063E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GToLIYvMvQXMm2U1Fkkdh6QSygis/uU9hd3kDjbKDCiselqVEqT1LJRbNgCqlPmB0i1/m/FaniWYjHljASNTYSmCVg8hHMcuVX8h03qcIH7Y0WODkjlBmOT6jnB+vwFDcjiPQoyGPbqdx2VH6ltSvfIdLTclq4KUapff+frub54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dTmqwLmG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dTmqwLmG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso16488385e9.1
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Sep 2026 08:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788620584; x=1789225384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLvnLjmDLrGiiA1v07CX3ZMiXBmMM+gMXxqBKqBcsk8=;
        b=dTmqwLmG6SDBT/Qo/E4VK8ssxokWZDyc0KPeY1JMyaJzzex1dxHLByCYPYFCQGhhES
         iPrDDUxeffsFLJ/xc1wSNLYff4LpwbbrluVY17Jsb5j4SCIh5spq5Rt3lW3Ae3XYqUzT
         KlrcxbK5asOSfnv3bRSUeAF4jkGbZ7+BnJKSo661ZfW9EtpDBVIv0CKon9JPxV6IP/bo
         KhwU/fTupnbOjK5/4FPNOypjulfB8HicubC2fv1cyhqbHrGNBi8HaPISLReJpPIc74RV
         WouTVjpx1mz06SKtmY7LQS96WsKXkJUL6OEDp10DEaVgUqCsACSH83SPpxY9toRDpUN9
         xGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788620584; x=1789225384;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MLvnLjmDLrGiiA1v07CX3ZMiXBmMM+gMXxqBKqBcsk8=;
        b=k9ziTYETKBR2sYJ0aRfGYaY4pmwJJYa9yVUAuIG65fE9sHiSBId79o4SbC9GKUSB9+
         Sc6OL/X7DPxvAgaXpMf7gW01Bfhz7Qgsj1KN3zClhUTfrMFQ623aYeOzWGngjQtA8dyw
         dMDQAWfmYwvIRCgJigG3YmD/TLZwpewW7ZkcubElfsnytA7Xx/dIhAf6/+tR1OQfIhEe
         x9pBmEM3kbk0jn6NMNjLH/Q9RWNlBC18F4g1at7fK8vuwdbx956yVz530Q1zY3GbggOA
         CAASpNwWnW1S8B7Sx3Y1wLLkH+nkLqVlzmGTfKHJtDFSNKO+t0+UaqgQSVl3QZ7GZvyY
         q00w==
X-Forwarded-Encrypted: i=1; AKwUvBxCNEtA29yeGB3vXJd1WlVaNxRw0yZK3G525X1BjNSD/H5i/YVGtFuA0BzZMd0947tHGr0uwA1ol1aFYIU=@vger.kernel.org
X-Gm-Message-State: AFuF++lGl2kXVL4k6SbljWvT/lSeDKBF+5Q6HbYgJB1HxZhgJe4ZPJFX
	81s3X2KHDbN4KAv9Y5Ozev5eOKSI9ED4TSnaLJudeOPqPg77FaF84VRW
X-Gm-Gg: AYBFou3qu+ADuertbsdi89DZCa/NAMDMXC/Rd8Yk8ineI3cxoUV6cTz7lo7Qi31Kwqm
	q1e8EhmazbNLZSk4P6CWZNk/QMG5ZyP9UGvlekKaUMuD4hTjSyRqXhg0+38Y+h8QW1e/jpWhDtE
	VBSUX4MA9X3KKKSapMI6yLHmd6SsxSKb6mtg0K/inu/MDqm3T/tJzQ81aXJma1MXd9wx+kKGnEz
	oVOi4iD/qCVCePFk5XK407VSdClFtCzq+peVrXoD9abY6g2gMjon0XkbZSHs0FrHcKeWvHrZkzK
	/wkNUVompXFhoNSwR+iuUPt0SNxP3I4CABeoo4VzW7KZqjJMZjJfyLhUB3qKuIewM4F4SqViWdd
	z9U9qFITwHS5mv3iF1l6zyXBYdvugghUbuEe5CMXeE4BYE+0aFcOC/tdT1WAwc8o0ZqRLQV1n5j
	atKK0zR+Xgeuj3Csav0ilzniJ1qWpzPEcnEfgNJGvqiGI0pDnwyP8sXIljV1vxjgrDX49kChlDF
	DJ4lIRu/KvNl/HnXMFAs4+zRXcV6XbJbJKXwfOayi2hEtzp4ksFHKJx2A==
X-Received: by 2002:a05:600c:3e19:b0:49c:fa21:e747 with SMTP id 5b1f17b1804b1-49cfa21e977mr101661385e9.29.1788620583491;
        Sat, 05 Sep 2026 08:03:03 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm337818035e9.15.2026.09.05.08.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 08:03:02 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <54814f0e-d36e-428f-9255-3c7c2c09b39a@gmail.com>
Date: Sat, 5 Sep 2026 16:03:01 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kconfig: fix shell function syntax in caveats
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905124045.42713-1-hexvalid@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260905124045.42713-1-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Erkan,

Thanks for the patch!

On 9/5/26 13:40, Erkan Erdem wrote:
> Kconfig separates a function name from its arguments with a comma, but
> the caveats section uses Make-style whitespace in its shell calls.
> These expressions expand as undefined variables rather than invoking
> the shell function, so the supposedly working CC_HAS_ENDIAN_FLAG
> example fails to parse.
> 
> Add the missing commas to the shell calls in this section. Keep the
> Make examples unchanged.
> 
> Fixes: 316d55d55f49 ("Documentation: kconfig: document a new Kconfig macro language")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> The issue was found and this patch and changelog were prepared with an AI
> coding assistant after a request to find a small, verifiable Linux fix.
> The assistant also prepared and ran the verification described below.
> 
> Validation:
> - Built the current Kconfig conf tool on macOS with Clang, Bison and Flex,
>   using -Wall -Wmissing-prototypes -Wstrict-prototypes -Werror.
> - Extracted the documented working CC_HAS_ENDIAN_FLAG example into a
>   minimal Kconfig, with a test gcc-check-flag helper returning y for either
>   endian flag. Before: syntax errors and no helper invocations for either
>   CPU endianness. After: both probes execute and CC_HAS_ENDIAN_FLAG=y.
> - Built the changed page alone with Sphinx, treating warnings as errors.
>   The complete kernel documentation set and kernel were not built.
> 
>  Documentation/kbuild/kconfig-macro-language.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
> index 6163467f..e15af278 100644
> --- a/Documentation/kbuild/kconfig-macro-language.rst
> +++ b/Documentation/kbuild/kconfig-macro-language.rst
> @@ -225,7 +225,7 @@ not work::
>              $(MY_TYPE) "foo"
>              default y
>  
> -Obviously from the design, $(shell command) is expanded in the textual
> +Obviously from the design, $(shell,command) is expanded in the textual
>  substitution phase. You cannot pass symbols to the 'shell' function.
>  
>  The following does not work as expected::
> @@ -236,12 +236,12 @@ The following does not work as expected::
>              default "-mlittle-endian" if CPU_LITTLE_ENDIAN
>  
>      config CC_HAS_ENDIAN_FLAG
> -            def_bool $(shell $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)
> +            def_bool $(shell, $(srctree)/scripts/gcc-check-flag ENDIAN_FLAG)

Here, the space after the comma is actually included in the argument.

Checking the tree, I found 20 instances of this, but none of them use
whitespace after the comma. It may be harmless in most (all?) cases, but
we probably want to exclude it when documenting ideal usage, anyway.

I think you got it right in your earlier '$(shell,command)' example.
>  
>  Instead, you can do like follows so that any function call is statically
>  expanded::
>  
>      config CC_HAS_ENDIAN_FLAG
>              bool
> -            default $(shell $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
> -            default $(shell $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
> +            default $(shell, $(srctree)/scripts/gcc-check-flag -mbig-endian) if CPU_BIG_ENDIAN
> +            default $(shell, $(srctree)/scripts/gcc-check-flag -mlittle-endian) if CPU_LITTLE_ENDIAN
> 
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c

Same thing here.

- Julian Braha

