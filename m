Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540138;
	b=xP99UuNOSJEhdrwNqGoeUCZraWtd6CDV5PZvEVv5cbNgZDQ6uvQ0hiFQAV9XhxlUxmqP
	 hvEHm+bWorE5hrXJBrb4QtdcaU2Y640p/04IYCK+0Oj8BjPdL++8A7hUg/06tU+Fws+JU
	 eG5Pwp5Jz9wpdWAw+hhzK8fMFL4iqD7Svh6d/ZYK6bh+akTxVL+0hc7QiXTk77jKmBu+S
	 RuaaZ9O+B3VLG1/O5QnvlqjZJDS6UOcLBcTv6JLcMQcgd/BRWPo6gjA9h/GJSYsFc1NnW
	 DheoOOTgKRboG4eNIanJ6bRC0ew9c9G6vehhUCn0MNVilzuaUScLTkGckukLSfxFjhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=D1Nuj0c85bvBmNt2X1dkz5A5qEMgMEBKUot79cJMsS8=;
	b=BLJkZ5KmLSYC5THD8X/IhCR+DUgm/KHSlShGOaGLzgZKJYwBYwvPBFWOH+qS+oopP83I
	 MpRmlg3Na3wQsibOXH/fFeIe81utrHN7aBJ/wZyY9gKMvl3DIZfYrydnabW2gYuRbvePK
	 aH02J5CrV1e1oTMx7DPBVZc5Wr9nMX3bnftAtrta+5sRHusaLbtzt7U2Qtp9rL1K1DWkE
	 7KLgilvHq02/P0/o0JYX70GoDahD7eHvFWcgEqGhOzELK1xomYaimRTPy71zhTTRkEw3u
	 8X9aG6XTU0K+rhnh+rZFs/2gRqu50sJmVaQXlWwcOt5ZhqoRNLPiE0eMvH63Eg2VrFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V2htlUnQ;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C1606A319
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 23:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00C1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V2htlUnQ
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab868eb9cfso99517a91.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 16:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792540137; x=1793144937; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D1Nuj0c85bvBmNt2X1dkz5A5qEMgMEBKUot79cJMsS8=;
        b=V2htlUnQI4mFScVT4WCEJvCyFfvGwJOvLHy2fV6tjXSuw7qnBh21d0hLgJHA3Mlug8
         itnzBgB3ZrO1GN6nXoftE23GS9PvFjqP94GTJ13t2/RR1IKmva9gigwohThc2d/Wwmd9
         Qa1qkmjK1rrM89uFvO+Vd3hKf1Ve6M81TRK8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540137; x=1793144937;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D1Nuj0c85bvBmNt2X1dkz5A5qEMgMEBKUot79cJMsS8=;
        b=KxJJZeyffQMPtgaEH0ojeTT8rpg+kYrb+rLCh2Mm+JpCi0eV+5KAIlQbvIe55sxDJ7
         Hu98co4AyDsC9leyQQc/j23TK6i/gIayf0dbcS+FJ6dDGezEX7sYU31FOLSBTxtvWu/R
         9ITYXbL7qX3eZUthN0Ed15zxtDHlun5t7N8h7cGHbgTEM1wMjVtm8i77IcCJhSqd1wuA
         ERuZl/tFC5F4lORiTsxAuzEDiQzloz3YinU/PkD+2YwjvUygCHA12H778SMKeCK8mxpV
         TswWJbdzZ6E6M2IRjlaA+SsAFK/CYiEUamzBeP4oy6IXoTkUFY7Iy+oVtoJ/IXiL2ShS
         rkmA==
X-Forwarded-Encrypted: i=1; AKwUvByGTFNSgy4gtF8M6KemMUYInNBHsPlKrOHLIGvDPxZftUxhJeMRBLtv580AXczu7PlBIaJdrMSf1fX4K/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+jPq4/rtGfDQ6OXxnh+ITyUVERqFgMXeFAZgIPGt8DSVoCZQX
	79l4eKkyQeI1O40/HciL2NXrI2i1fMfTDvhP0GwJ0/hgzEXRsGgzCkW1BJQDESftQjejGLsHNjW
	vfnkbeQ==
X-Gm-Gg: AYBFou2kIch2DYoH0zk0TA3d8+vVPdwZk2T+6L8jNB6ibpskMVZ4wLQGMYdTQCj9DjQ
	lU6SszGFWw6LeMViwdudYK5H4f///0qH4ckbTnNiOeFtXvnco5TZlqP+4KurgYuJX0785xy0xBZ
	FB0sI7pXDGuMOcWCP0dCTONLfBzIu2vQaELWmn3p6kyb7SdkKaRvUwkZYjsO6EviO1AYer1l1Nq
	a3+pik/NOt9/piB3pBCuzc+SchFy/oxCtIQB39PL/8rjR1LAAltBrKZWu+agxcE9GC01Dvl6m4c
	r/twh9DcmMDOSQwTEyVtY+QW79G1+Y4hzP5X+IIJFB9UrrUWLduKMR7RpIckw6XJ18/dO7G8byP
	chdadxKv5xJD5R27SG8jKwFKgS8X80JXV/yRsbl4eea9HtMdOKZ5A+5GZ7u8RYI+E0z8qK2JwLq
	uX1INviaJdbSFt8unJIIeOfjEo81t6WGhMk2mtt18mZXdPeHIJFGIfjX3ex9kXOA0UXA1+jBHgK
	bOTdBR9w9qNQCrPn9b3rLjeN7SuzBx1/ZVQqeE=
X-Received: by 2002:a17:90b:4c49:b0:3a8:32f2:f4a5 with SMTP id 98e67ed59e1d1-3ad86f1c242mr330772a91.53.1792540137237;
        Tue, 20 Oct 2026 16:48:57 -0700 (PDT)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8029765fsm1426074a91.10.2026.10.20.16.48.56
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 16:48:56 -0700 (PDT)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so218092eec.0
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 16:48:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxh60Ap6L0yo+R4U37/eO9VgTKlzdECd3RKwEmkohtnZGR4Q3oHlTzgacbM/f/Z+ebUiwq7yFrvL5jtTEs=@vger.kernel.org
X-Received: by 2002:a05:701b:270b:b0:187:a2b1:7b3a with SMTP id
 a92af1059eb24-190a6adcc50mr423407c88.41.1792540135068; Tue, 20 Oct 2026
 16:48:55 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-kconfig-fix-mfentry-check-v1-0-428258bc0fc0@kernel.org>
In-Reply-To: <20261020-kconfig-fix-mfentry-check-v1-0-428258bc0fc0@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 21 Oct 2026 08:48:40 +0900
X-Gmail-Original-Message-ID: <CANiDSCt=7SorMBAUXTohsSV_-6BZPrHbC9u80-P7=kYO4NiUJw@mail.gmail.com>
X-Gm-Features: AclHuK_NFTuQpEwblXCYU1ELdfOsTXBO_zAq82tRWKGwdXrwLnDaicFsmdlXQkQ
Message-ID: <CANiDSCt=7SorMBAUXTohsSV_-6BZPrHbC9u80-P7=kYO4NiUJw@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: Fallout from moving '-mfentry' check into
 Kconfig stage
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan

Thanks for the series, it fixes the issue for media-ci

Tested-by: Ricardo Ribalda <ribalda@chromium.org>


On Wed, 21 Oct 2026 at 06:52, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi all,
>
> Ricardo reported an issue from moving the compiler test for '-mfentry'
> into Kconfig. In testing that patch, I noticed that the kernel.org GCC
> builds for s390 were not probing correctly for '-mfentry' support.
>
> The first patch moves the check for '-mfentry' back into Kbuild where we
> have the proper information for whether this flag is actually supported.
>
> The second patch documents the reasons for these issues for future
> travelers to hopefully avoid these problems.
>
> I plan to take this via kbuild-fixes after sufficient review/comments.
>
> ---
> Nathan Chancellor (2):
>       kbuild: Move testing of '-mfentry' back to Makefile from Kconfig
>       scripts/Kconfig.toolchain: Highlight cc-option differences between Kconfig and Kbuild
>
>  Makefile                  |  3 ++-
>  scripts/Kconfig.toolchain | 23 +++++++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
> ---
> base-commit: 997208ce9f43f01febac956cf9aeffe89945e3c1
> change-id: 20261020-kconfig-fix-mfentry-check-50525bc5a6ca
>
> Best regards,
> --
> Cheers,
> Nathan
>


-- 
Ricardo Ribalda
