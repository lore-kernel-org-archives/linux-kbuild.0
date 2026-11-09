Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242593;
	b=W3lbnNXRigOVSL+OY/Oh1focBJ3mN61ynXQjkGCpJPVlMBfXkHb4K9CKe0AWrU8k9sz5
	 xf5mfzigDNTAIRmGcaEXOTtDolCJ8FOFU+SPfS87GEmW/IXXVDGk4HlJG8PRUQ65o1mXU
	 boJ+7wJSRTw09HLZSdaoz82pItUWTTom3YQvyiJYwJKWvFDaBwDq12smFAQkZEZ0FeEx5
	 OU4EqSKUsEdiI964tFCJsldpPKke5Z5fQugU2NqXXhdhkAjp73hSpT2gnNO+BpeAff1Od
	 QUMABndtftX+zL1BsPQIz37ZF9th6CkwHIppf3yS9kfgjc0shFQOaJCuqzeFK3FeKlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
	b=S+JHweP4EVB+ZPTDJ1ji7t3phtWNriaGKZiyDsNwVMuCKxkqZZKUl3aIe5Fhuju+XwS5
	 yC9IburrglkAVZugL8of/zNqe5Dp5xZF5RTBtq+BdjvewkpRDIeoPdwHdOu/pSlhoSb7C
	 4gC3aN4zx7uuJAoMxa5SsRN3wQAZF5+LIg0Bm6tLN4tkjjpDTwIfS4EIab46PZEfxnuue
	 kiVb0y46MJ6s1Mr3wFQzcgHNBsZgkncL3YDis5GQPxJNYxIdf9mE9dCA7QMcZdzVildwn
	 hgmgo5GrWJLjyDME37QjVEXiv6ixQKaL64w4UfTgjnHWTRoV9FfbCTlkOU9beu/nLgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YGuhw1oZ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FFC606A337
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Nov 2026 16:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FFC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YGuhw1oZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so13493165e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 08:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794242591; x=1794847391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=YGuhw1oZxUPL/bbx+i0ijosSnISYIbUul/qGq2zAELOacB08dvYDccSx/x9rU6g9gl
         QyPht0zwbkvD9ejc3WNj6TDVij9KZUrBEQ9Xt5i0q2PMick2I5G7BiPPIhuJ5QsC5cpF
         Hc9VdS41J2qakEC5kRjP6W1h9qpqNpRyQS76N9UiluO+WrKbrxUc+eHpH3MgwEVU/LBg
         EKYTjvlmvVcRDnUT5YdBxwyzf6msDAIK2mLzEprKTk57LkQxxSPMwQJzYJo0fRMdPBCc
         S1EcyuYCyB06Nre1/tH9qJ9dfWqNPjCBc4QnRUd5kWvI+126KhchYL1WWv8hq+Sx8TwT
         sacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242591; x=1794847391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HLYen38mKGP677B1oAzbJm7ZesXCZSDjKVwDLOHWtRg=;
        b=o1JhYa+kUJKrW0ekvPdLQHi51air6MSGVNFPvR+7cHtMTVgMqt3MbNDhfweZjOO+5l
         JhY3h7e+XflcWFhnqPYTqQRAGDcIE7bDAQhckb5Fw8qLvH1rkzfg0ykgi3LkSNpoIXxE
         iN/s/PkNxrfAjK06I5q8Rgwe7hWwTZpe+gXTrBaKD0m+POYu+4b8i+InVXo4bBvDD1lr
         9XbSJ5PkXI6Hqny9bhx+HweDX/wnsY+l3wvDUmPLfHviyRcx12vgq66wHv6WBkLin8sc
         yMlYcRq5h+G0ANEK9hAfNGN+ZXFOR6RUfnUcOhv3S/9aw+lmzRFH2xLtSNHtQbJlNzDN
         Fasg==
X-Forwarded-Encrypted: i=1; AL+hErHd6ZLlhAG3epgKvf/X8myPwt5rz6mJ6/enk7L2Vt2F6qtUXOt1JSLI9fvSQMhLytnaRvoFBzT6Em1PSvU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DmO9jAavJ+k4M0ljgHGN8bHOUQujPRyNuxZjnQVQBV9Xi5suX
	R4GIF0TuEdXYF2W6kSVzfV349u0th4pFizi4uRywozDSuJFO2S7IbzmKtHDgkowaLJQ=
X-Gm-Gg: AYBFou1gWogiKxIGE4ZyWVhcq+UbtJk/bvGEkm8E1uG7UwdkLCrMZY2naK6JftFQmW7
	zTNe/P710wRLAn6+ueMZYTax2i1ngIwG4IJm4HvMlb6KjeinNl4IFX14ZK55DSzcLXVVAn5f+fL
	19egaJYzrAlabvaYkBTcpKzpvUedhr9TZVGOblZSWUfwzJGziG5uidWNEPpsjKzO9s/Oo46U5g/
	/8KgVmVFz6lwVeh3AAlwreWepZ1kRt8kW3JHVDtT/orV5IFLWDRRsXHYbtA2hN5WzlUrzcXymOb
	ej5pNsVnqmoADnNw7m4m7B381MnkBydAAC5eaVjabvAXQ6cXWQwyJYVuMo6TjJ/EfY5Z/4PFLNJ
	cxZTLPA2QgCfwnxe+sgdGzOdeiae+PbOCYHzzgV7bugmTklhFz3l5Mv3yL/dtx3d5lqGD2gfhgZ
	/ihDMN78sYSVbKqbgkm8PuY2lOcpcyLuuTPI1nYuKRN1INwQXlcKHLmo5kCdAgTeb4Pd3cFWPNb
	zT4sqd4THT1raTVXGQeFULy9aNkgLNYfNmJEkgBx4TGtUNSHOdgj8c7QZCTpdAIEHCPBgiubhdu
	R6Nxkxlh/hUuh8pefFgHWDGw7RUquWByuLulkEl2agWdpJFlspcO841vWNgwdnMn
X-Received: by 2002:a05:600c:3508:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ba015b8c6amr1961265e9.0.1794242591012;
        Mon, 09 Nov 2026 08:43:11 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01d8ae9fsm806785e9.3.2026.11.09.08.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:43:10 -0800 (PST)
Message-ID: <1dddcf29-36a9-4ffd-999f-54b730c9ea27@suse.com>
Date: Mon, 9 Nov 2026 17:43:09 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] modpost: cache section relocation mismatch state
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261104-build-speedup-v5-3-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:20 PM, Lorenzo Stoakes (ARM) wrote:
> For every relocation modpost invokes check_section_mismatch() to determine
> whether there is any kind of mismatch between the source and destination,
> and if so which classification applies.
> 
> Each time it does this it invokes section_mismatch() which iterates
> through the sectioncheck[] array every time it's called.
> 
> When walked a relocation section the source is fixed and there aren't many
> targets, so the same names are looked up over and over again.
> 
> Therefore cache not only mismatch categorisation but also whether a
> mismatch even exists for a given section and look up the sections in the
> cache.
> 
> Special indices (undefined, absolute, common) take the uncached path as
> before.
> 
> This results in very significant speed ups for allmodconfig incremental
> builds.
> 
> modpost is on the serial tail of every build that links vmlinux.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 defconfig, touch mm/vma.c, gcc        8.5s     8.3s    -0.14s (-2%)
>   x86 defconfig, touch mm/vma.c, clang      7.7s     7.6s    -0.13s (-2%)
>   x86 allmodconfig, touch mm/vma.c, gcc    33.9s    29.4s     -4.5s (-13%)
>   x86 allmodconfig, touch mm/vma.c, clang  31.9s    27.9s     -4.0s (-13%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Looks reasonable to me.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
