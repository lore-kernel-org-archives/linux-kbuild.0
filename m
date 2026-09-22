Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2E6530E0A
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 08:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790066492; cv=none; b=cSnA92PjSWd1K20zRNO3zMt/r3+rkEF2HBM0unPyR9pZjpgOwE0x7z7LJ3qgt3q1UhPBGyfr/wIN0TFovbe5/JAns1TxDHouDbeKT9zKjuq3bMLgG6dr9HMYWLal8s6tdF1u54r+E27uZuBWNSgLC5NytE30b0U4x3ah3Uf/7fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790066492; c=relaxed/simple;
	bh=kOlxOzHhVvQ0sv7Ka/MactNXSbragQda2YaQkUVz2ZU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gKW+NRxVOhA2sJFqCssVEB45i1gH9/UVyJB79nUIgWSgFQhN9fEVpBNFP09KwUexXJa+I2C3V10DaS0ZAB7Op3ApDgOJWvjwkRz3Q07Fbl3/iN/tzE3ofJ7N12rEr+7HQ7Yxxy9GXjv2v3mqMqEq27Od32FRcK4gh57kAM5iiYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImcOj2QM; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImcOj2QM"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so1035456f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 01:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066488; x=1790671288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbg33pT6Fj2JHlCGEBzVZXSsW4USfoXndE7ADPxXyBU=;
        b=ImcOj2QMGpUz+C5+gC2ReEPGiUIn18wXse9HbltG6mDd3sIgsBz3uUZsTruvWi9RQx
         hfnMKR2SyGaApfOZ9mJuyTWyeNvIin/hO9iqaAmi9TqAZxkVJ1QsDT/6SubDurBeqMEt
         RutKbJuWooVwABlXVzTJgeiaVyjsK/eORpLr3KXaNkDO7OT5Qd80m2IGXg1pkLXmdsu6
         OdhnB70VNneNtZyX2Yq9RMzoxDuCCMj3U5U/fJDSluzVrydwThqigBqbfnAMQcjVgjvr
         QWQwbGp39kGTFuuMiYtoHbnqLlbgb+HPe8DBfH5EeuxneZJ53y96iLks1Olzgwk3r5yj
         yb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066488; x=1790671288;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbg33pT6Fj2JHlCGEBzVZXSsW4USfoXndE7ADPxXyBU=;
        b=ccNVutJXfhHYU5RUtTz/ayddcT5lFxP1ieWRkH7YFVELC3c0YJGIRNXeVekkSdwphv
         Uv+mMBY7tiNQ0oXW6h17J5388peeTDYMh8VAhxDnA3UbMRrdOu899zKXh/nPi147w3RF
         KUXkrjEl4So2DSfbNFOayK0OnGVbDNZX09ft2TIQ1s8cDgz+5mb+RFIdoiifDArAu3Ro
         l7pFI5bJ2hakn3MVv6ESYl4um5nR62MvRH8kzWK6vxYSEOMSsJiQE+3PFRkA0rA2EU9U
         rLjVdut5mQxdZ2rWWqcrJRrwxlJMpduplaK8OkFIoOZvyUMgj6RjCo0RtIHn3RxdSfA6
         BYdA==
X-Forwarded-Encrypted: i=1; AKwUvBzmk5ySwBWWZNnY2kW+XHZ6bVBgusfNG0qPulSbJxDRdqk4k6Jia7OLXH5gHGJLeKM56Ou9whT7NGzBoCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lhNpksy2CF1pfQsERZxLMhHa5DFlGsZVMVVS1mOj/GyT28ZN35
	xcNUSGS6niHg/0NtMANQOVe04mhCBdhg5CsFDTrmlR5udpOdchDoFKXV
X-Gm-Gg: AYBFou3o7njt5jUTWoZvp3Au/FDPXh2WCiaf6kx+ORLw4SMg8csE35esvj7YtNHfbgK
	OkIsXoLuYDbXRowX7FGthAd2NQDTuA50FmTb51OvUPcMp/Vp3dBOMBQxcxhcM6ixF4q7E5lfmyX
	zdt0VJNWrqfctnI1jqxf5wtmsueV0xCdeyF5ojCsIHhOwJHPRl64FlThUxJ3yjGo+9/wPAZUzYx
	JZOJ0QydREoHZZ2Dw1f6Lpx5MZpuW4ePxwlCS8spsfnNWcckEU7NofQLG26ayb3C4GPqr8mc5l5
	FgdIWA2pAqIXOclDc7wYrq7M7B5+atfGfP9HU96PeKQDNnFAjO23byBxCNh8EKXsOcPZmUhcilU
	h68mZJQaKZFkA7i6tOHZTOUfkLZ/zeLC8ypufUUD+AJ2WdDmcTrBvX/RhjFI8utWWZR7EW5LTpE
	ZorgPucu6KR2Fp0Nwsz/KSfyxz7jUwVBpCh5aBxmZkY9yDcHdWSgMBN2MnUYUQvKyRoEsOn5dr5
	IXT4QWLKtk0ve9uPNg17g1gv7nSUt2c1zQ=
X-Received: by 2002:a05:6000:1861:b0:488:5852:6ee3 with SMTP id ffacd0b85a97d-48858527005mr10835062f8f.34.1790066487965;
        Tue, 22 Sep 2026 01:41:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886277e841sm3674945f8f.19.2026.09.22.01.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:41:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:41:26 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Kees Cook <kees@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH v2 0/3] kallsyms: Accelerate symbol name lookups by ~19x
Message-ID: <20260922094126.05bdc42a@pumpkin>
In-Reply-To: <20260922-ksyms-tune-v2-0-a333ee31eac7@gmail.com>
References: <20260922-ksyms-tune-v2-0-a333ee31eac7@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 01:19:18 -0600
Jim Cromie <jim.cromie@gmail.com> wrote:

> kallsyms_lookup_names() resolves symbol names to addresses using a
> 17-step binary search over kallsyms_names[] (~184k symbols on x86_64).
> At each step of the search, two bottlenecks compound to create
> substantial lookup latency:
> 
> 0. Marker scanning: get_symbol_offset() scans sequentially from the
>    nearest 256-symbol marker, decoding an average of ~128 ULEB128 record
>    headers per probe (~2,176 header decodes per lookup).
> 
> 1. Redundant string expansion: kallsyms_expand_symbol() decompresses
>    the entire candidate symbol into a 512-byte stack buffer (namebuf)
>    before calling strcmp(), even though ~94% of binary search probes
>    mismatch on the first 1-2 characters.
> 
> Together, these bottlenecks impose a ~3.8 us latency penalty per hit and
> ~3.6 us per miss.

How much does just doing change 1 give you?
Might be worth putting that patch first.

If you do the binary chop using only 256 aligned symbols it won't add
any more stages but means you don't need to scan until the 256 symbol
block has been identified.
At that point there are two options:
B: A linear scan - average 128 compare per lookup.
A: Generate a table of the offsets for the next 128 symbols and do
   a binary scan (only read the second 128 if in the second half).

The linear scan may not be too bad.
You can get the first data byte while sorting out the length and then
to an initial check that the first few characters match before adding
in the complexity of the loop along the compressed data.

David
