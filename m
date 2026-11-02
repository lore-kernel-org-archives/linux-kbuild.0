Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612839;
	b=CmISYH5IexagqRYfu+C8x80jvgKzarZLYodirNFZA8064SOWchcwhleIgPNPDY2cB8Dl
	 WK+iEtLESBSn7rgX7J958VkUJjX8uTYqLXKuGXQ+0cxFmc5vbVtNuNEyQvF3XdQhfhIpZ
	 FhAcJbFdJIAaxhxornq1+s+1jql2Bn9//hddrvepPmMJZ+7lR7vZDDeoBOnuR1FX6v1gh
	 zajG9nZPspBj3iAfobUGOGjFzM6hi3TRUJVRxAp5Cewdnya3LXz6hiDbEKFoq2Ivb3cDx
	 ZFpJNbpJwDBV4ds/DJErFOyXA/yevQB6I98dHVqBbdNjo8ZBKfsBjz2MC63DWFrv0zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rjC0SO288nozDJZ8OrlHX0ewHEgSx4tejen6ilnxb4M=;
	b=YLQImohGuqNcySJ1D9h2KK8asZtkEm81q4ZTLsA3rQDqJSywt8bySilYNtbnwLjnfY0B
	 YdqozeNe6lAdW/349VWXOe0YBlHlc7TeoB6csGe1uCGAbZA+0heV2ADOitYxlW7cn0TIG
	 2XYbe/62rccGHK1fCB3TH0JDFrJbS118/3hU0Mh/66SdRADEsvvIYYKkFjG7bPDhRInn5
	 WTNHk/ie17EF9TgdgOrujGWqQgIgjrHANOePSyE4T5fNNHyLmr5ltTFSBnZzI5WdR3nvO
	 SYnjBq/b9tdMq35Dff3yL8SPID6/Tunm2yIuL10bjtjLMNDoS97XHAjYNpZqxf9uRyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1KK6AZb;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77894606A32F
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Nov 2026 09:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77894606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n1KK6AZb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso22873565e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2026 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612838; x=1794217638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rjC0SO288nozDJZ8OrlHX0ewHEgSx4tejen6ilnxb4M=;
        b=n1KK6AZbI0KfAp1IrB8zr0A9zMi8u8uLjJAcfCWEN4jhhBdGkYSdkyL6kGDs7JvRp9
         9sgT4lZGu2w9Hby415A/sw+EgRCMJtm0/bF2tYiSzTV8vp1zfYsJkMghrzLlxIM7fcHJ
         5QlPoozkqyfHgDlgqkPqtD025W8bCXZmbCq2ZMB4DwQj933mCf9XrGRZJpcXTzfRvHhr
         HzHLFZiMf8TyBjXSC1QvVGOnz3TuH3Pz2KtM9PJ6ZUEHwogqRvjLEsAdOGulrBt5ujfw
         fBlwDTLzBE54AbE9Q6hDrjrXeAGPsklorto816SwNHA0fnTaKqlKgneSKtJIhdqO4UWV
         XYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612838; x=1794217638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjC0SO288nozDJZ8OrlHX0ewHEgSx4tejen6ilnxb4M=;
        b=VtpBEfKs2hlryF6HY7gxNdC8BIK3woDr8K4KB4COF1Vmxm0Q5DJnFibgCx3e7+8vlR
         wwy70JR9G3Kh9ASC/MtQp4TKeeju9VcpabKJ0aRoSHlwUIcqmw9H2ycAjkXCf2l3AYgb
         qPUe+ponJ8vbOj/O1e5PtTv/IduS8KXNY8ypznJEqf8lTflQq/pgAYyvvaSVUuJ+7+fi
         0KoJglJ4Eo4VsGhp+K15lmBQGhekBS4mdQ/8vhAGCRct9jp+yLNrBTLsRzQDfin9QY7/
         8jUCI5Te4juaH9FFCdkY9PZ3JT3w6XJ5hrl2O87bCxdYyyM3ZdwCS9Iq6+F0exd0Nw1C
         mMYA==
X-Forwarded-Encrypted: i=1; AKwUvBzMtwJi5tWXV201qm3Vwg+019Xw3Q7MV3fQNqJgmEIWxw+9YlmSlI/E7NbD1PuTiRLCoy3WWRdMeig4v28=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIG4NeuMYInEX0ZyWG1VuWJAs/zTEuaGMd8N1HYZY372H0cHfP
	Xi8SAj9k8T7+en/0FcXcLuRpEZNFik0paLgx99Byg2gBfwLn++HKQQ1T
X-Gm-Gg: AYBFou2FqPTe47t/sVVR5NDFZfx0gOvn9nDo91HnFOH0R6608F90P/SJ/CTeDU6r7DK
	HSHkMPvY6KKAR1JFfxs0I/tQq9N9sHZEPAMdY2ItrafSGLbIUE9AJ9ul5io7/Owki+qPvZctS3S
	uaHXXdzF2GKY/GTDVUeJZKZEfYOHaTp7ljxKC/v1xBRkiIVPFD0122emvH41MnR7Fph6r2w+XzG
	LDfXy8P2r8m+8iEmaO5ugpdY9FGbUkzYWmn4ugF9ljplVCHJ0okPi6aio6m3tVZSXcFYb9ng4LZ
	tT9ob3i0lxnzY42HqXtaXjRobGtRr+9putzPVY3sUBtI9Pf0NMdy/tJIitwZl5bfr2T3dbyoFKA
	IelV1MCjSM6FneWBB1wVgfPP8orTA0qmZbsEiHYVTm2S7wHssO7cRUnvWhHs5CiNiAmxbXgGxDW
	jtc5/RxOBwiRxsfcp5xe3lOfEUOJY9Gi+T+yi7B0J5oUy9N/gT7al+ocR/SSFVHb0cIEhFICbtO
	WnfvK9dB5wP6IXqmZjCIceTPditc1IrMsmXOTtDnDd2lscmL/i1wuqaIrv5HT0m6sgw3ruKpi37
	FFp4E2EN3SIqTj4qe+NPHF1M7WluYe3mGh4D41waw+d4uT+xntH7MMFrTFaMEa3J
X-Received: by 2002:a05:600c:1d07:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4ac150b229cmr228838185e9.2.1793612837680;
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm496522815e9.15.2026.11.02.01.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Date: Mon, 2 Nov 2026 09:47:16 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Speed up KConfig - fix hashtable confusion
Message-ID: <20261102094716.2c8b1cdd@pumpkin>
In-Reply-To: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 1 Nov 2026 12:08:15 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> So the Kconfig 'expr_lookup()' function is criminally slow and takes
> over 10% of the time of "make oldconfig".
> 
> The reason is that it's called just a lot, but it *really* doesn't
> help that the scripting versions of the hashtable functions has not
> understood the subtler issues of the hashing code that it took from
> the kernel side, and in the process got things very very wrong.
> 
> The "hash_32()" function is a perfectly fine hashing function - there
> are better ones around, but it's fast and "good enough". But when you
> use it, you need to understand that it puts the significant bits in
> the *high* bits of the result.
> 
> The kernel uses a model where you give it the number of bits you want,
> and it will pick out those high bits, which makes it all work right.
> 
> But the simplified hashtable code for the host code didn't use those
> high bits of the key. It just did
> 
>     (key) % HASH_SIZE(table)
> 
> to pick the hash table entry, and that's basically pessimal. When
> hashing an address that typically has the low bits clear, the low bits
> of "hash_32()" will *also* be clear. So the hash table ended up being
> mostly empty! So even though the hash table was sized appropriately,
> it wasn't being very efficient. And while making the hash table larger
> mostly hides the problem, it's the wrong solution, because the cache
> footprint gets worse.
> 
> Teach "hash_head()" to use the high bits of the key. Because the users
> don't pass in the number of bits they want, this is pretty hacky:
> 
>     #define HASH_KEY(key,size) \
>         (unsigned int)((unsigned int)(key)/(0x100000000ull/(size)))

An alternative would be:
	((key) * (u64)(size)) >> 32
which avoids the division when size isn't a constant power of 2.

David

> 
> but at least this improves on things.
> 
> I also stopped the expr_lookup() key generation from using XOR of two
> pointers, which I suspect just ended up clearing most of the shared
> bits. I doubt that makes a difference, but XOR of thigns that may have
> shared bits really isn't great.
> 
> The cost of 'expr_lookup()' drops by a about factor of four on my
> machine, and it's no longer the hottest function in all of 'make
> oldconfig'.
> 
> No, "make oldconfig" still isn't the fastest thing around, but at
> least this removes on particularly stupid reason for it being slower
> than it needs to be.
> 
> Somebody needs to double-check this. I don't love my HASH_KEY() macro,
> but it should work for power-of-2 sizes. And as far as I can tell, all
> the hash tables are powers of two.
> 
> Comments?
> 
>                 Linus

