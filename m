Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC4C384CED
	for <linux-kbuild@vger.kernel.org>; Sat,  5 Sep 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617513; cv=none; b=q7V5DuONZe1KMTN9wXfmi6G/K5+VUauLtIB9dm2GPJmW0LMMRJ80pUFTGCgkJOUKw3QDG2BzthYStDLhPookLqYJYT4gFLJKzKvnBCcM25Y/gc7Fx/CMDdJA511bJOIHO3WZNMmdAjslu0p6P4YdUCLKMFdRg3kuWaPJknoXKjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617513; c=relaxed/simple;
	bh=gGIQqAtOYp6FmGoba/0GwWH7Rb1QNGW3JCo9imFFhSU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IUa8prTkWY02F7MdtP0W02hAkq/ttA6h+/RpLvfPknExpEgS7Ojahej/CNfp6RUVAgMc0+0EvwVi4kRLypb8FnPCIB9CxNMyP4utOT/JxlkVRnnUYLtrAjtJLTQQHZOFQKY2KjAG7JIRm2mURQjqyD6PVWxRS+vKzh8wq80qcDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJCb+/Ws; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJCb+/Ws"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so14845055e9.3
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Sep 2026 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617510; x=1789222310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zoxIv5Nmy3/BgkU/sQVcWqwr00bml9z+9xXr1ZneJw=;
        b=gJCb+/Wsg47vM3/Q/sCuxv3QrBhGU8jo5TiaF/jUh6hy/6m3cuTgRtih4Z52g+/Rlu
         4Vl29zeFCY6LuVwu8fVIYvp92pROIpb9gL3jOWATufC7hj3Tu8Pgn57D7GXsxyjj98os
         EpsFnwn/OZWFMF1GALB5JAGjV+5jh+3oA56ruXJGvAXD8+WuNse+ONFXOBtpLIgy0+0S
         TXFGmWv2SQHFAq/Mng4+yj3SkaVDN0X7Hwh6iStKvMPl3Ipxvh0n2M0IEeG/M4GP4bLK
         3CEFILpmIlZehOGZ039OLh6k6LQ31oJ4omb90XhwM9Yop1UxJnhQW2b0Bcg4Wg2ox49M
         7+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617510; x=1789222310;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4zoxIv5Nmy3/BgkU/sQVcWqwr00bml9z+9xXr1ZneJw=;
        b=JtT2PvIOvf6PLfZ/y6YAGuPJH16/AyA/9ED/kJIR74peu4xLCke7zaXELxr1RBxf0L
         k0qoTkTBA7dgjAu1mzZzVX6dEIrmzFgPjjkvfmiEhoZaWx950Dftfe6/9eZ0EVhfmnpt
         0YM2H/z3ROBZcoO/OCOzW1MYb3nPnOtH1aI5n61L7qTyq1uujgD2cp9HMzVOXFkTQyWl
         otrYBpkxWyqiEXH1NwcIGKAr130vj0FSgxIM6nVxqSK2oUNdIOmVQ2Pbn7ju5I+pZp+h
         3znat9e1XCiLNeXGGFeeb32psjeXqKRMYOo9F44tcPWG8KNA0coJ1NZ++8+Ylh8ED8dl
         SlDw==
X-Gm-Message-State: AFuF++nrKofhhlcO1j8RPt4Eg7qLLQv6Lw9HPNyLkAC2X8/CpJCSw5eP
	Reol41fRDFXmNz07fhfBj+Z2HU+rN5UyDrcxvCS1c50xuvIoNl54cUFU
X-Gm-Gg: AYBFou31YxRPaf2VQ7iOJ3DNhQ8DL1g0GvBD/p073VxSeo8rjKWY4UvRyx9+kVvBlN2
	IW2hnDJ/EhtDkAVh46UMnAknL2RMiJ/gzBsOUuG/ZE6EoWt2OR7dA7RMnB4n8oavaxFIYQjJttK
	bWveN9B9KY7PSq7Ks+BFwE1UssF/MrQt3VuiO5srfhy/bvxpY6RufzSKG1zh1dO/SquAdcFiqVN
	NhSQHgcjd9yHmBonsy0p2eCx5q3kJipn1sk03mKMRX3QL2017IeQQBiMV+67Qr1KCkGxX0Jiy3e
	L0QUDsxkajZC4WWfjZI2/+jCdgzb6wwlSgBUtIWuvnxszpf9qTJHT616l0WKpAlS8AIEhxhvWH/
	rPHAYt+2m4chDcKYv536Cx6zy1FN88aIw/cY6FSY/fmfhBZkAX87nagLMI0cUgHAzrmHEmEtpV/
	xqFqT63OLVeQHnDkqOPDdv4W+GtcTH1GxEVeB+x6gsVYO8M8cSpxuD9aAMksxfUQnC1G6DMzoFw
	8OnwmkenXAj6rSM33X7Og4CWEKaExexNZ9IRR5GRNUBOv7QnZURKzdspdxlnsS/jMY=
X-Received: by 2002:a05:600c:6011:b0:49c:ffa2:1f3d with SMTP id 5b1f17b1804b1-49cffa21f83mr54434245e9.30.1788617505797;
        Sat, 05 Sep 2026 07:11:45 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm14931097f8f.10.2026.09.05.07.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 07:11:45 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <1235548d-5326-4ab7-be9a-f33954e8fe40@gmail.com>
Date: Sat, 5 Sep 2026 15:11:44 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH 1/2] kconfig: preserve the final answer when input has no
 newline
To: Erkan Erdem <hexvalid@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905123237.40670-1-hexvalid@gmail.com>
Content-Language: en-US
In-Reply-To: <20260905123237.40670-1-hexvalid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Erkan,

I see that this is your first patch submission to the kernel. Welcome!

First thing, if you run the ./scripts/get_maintainer.pl check on this
patch, it should list a few more people to CC.

On 9/5/26 13:32, Erkan Erdem wrote:
> conf_string() unconditionally removes the last character returned by
> fgets(), assuming that it is a newline. When redirected input ends
> without a newline, the last character is part of the answer instead.
> For example, feeding 42 to an integer prompt stores 4, and feeding
> 0xff to a hexadecimal prompt stores 0xf. Both commands succeed despite
> silently changing the supplied value.
> 
> Strip the newline with strcspn() so that a complete answer at EOF is
> preserved. Keep the existing handling of newline-terminated and empty
> answers unchanged.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Assisted-by: LLM
> Signed-off-by: Erkan Erdem <hexvalid@gmail.com>
> ---
> 
> An AI coding assistant found the issue, prepared the fix and changelog,
> and ran the verification below after a request to find reproducible
> functional bugs in Linux development tools.
> 
> Validation:
> - Built conf with Clang on macOS and GCC in an x86_64 Linux container,
>   using -Wall -Wmissing-prototypes -Wstrict-prototypes -Werror.
> - Ran 60 before/after executions on each platform, covering oldaskconfig
>   and oldconfig with string, int and hex answers. Unterminated answers
>   retain their last character. Newline, empty-answer, empty-input and
>   CRLF controls keep the same results.
> - The 21 existing Kconfig tests pass on macOS.
> - This tests the host configuration tool; a complete kernel was not built.

Since you already have some tests, it would be good to add a basic test
for this in scripts/kconfig/tests.

Kconfig doesn't have as many tests as it should, and it's been
complained about by some core maintainers in the past [1].

> 
>  scripts/kconfig/conf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b..46c9ca64 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -343,7 +343,7 @@ static int conf_string(struct menu *menu)
>  			}
>  			/* fall through */
>  		default:
> -			line[strlen(line)-1] = 0;
> +			line[strcspn(line, "\n")] = 0;
>  			def = line;
>  		}
>  		if (def && sym_set_string_value(sym, def))
> 
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c

Otherwise this change looks good to me (and is more readable).

Link: https://lore.kernel.org/all/20180206093803.GC31558@kroah.com/ [1]

- Julian Braha

