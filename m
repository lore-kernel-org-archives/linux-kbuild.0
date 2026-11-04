Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753350;
	b=Q11HeTBRS1YeZXXsJ4TI0sBpFA0OzJDW4N7czUV8fzKDgJ6n9a2+56g6veK6HuhylEeM
	 C3q16/MviuG6lcWnCiE+tKHj95FqWABlw/zRtnSMYXZNytGV5RBfa2pDGaTtdTYfHFvqD
	 qIhh+Y1pKSgdLz14lIq47LTzPnSp81DDgMJiFeKsok1L5ZIEkR3z7LbH5Q2kDhzBNlCC3
	 GpFcEwHI0spr/uFP2CYPE5uZiGPCOgO7XsL0Ai7pnvfQJGrDIP66hi2hxWMvnNArN8Mpl
	 KQW6RAsQMM25O7OCKDd1+Y8KOZEQecG8nZgN1EGJz/218kZEw+EoBO3ZsV52VzROMpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753350;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+sUJ84Ka0ak0v8/OB1wtWzXzCPWXpeiQ6G3/ZQmSqnU=;
	b=WZLjAaDwjPvin3FveZ7QwOs1XQppwuES5+DgoRzqr9JwuYvjKndgFABBpqFKTqUbtnFK
	 KiTyTDsYyfG70BM6H4To8iIKtpT7zrPRdfr3PxGBopgmIJPVfMjCjjUBnviZ7THHgLj8/
	 FwPFkujYermLefKl8Jg9wWusOq+ujJ3rcQ1SpWC+lk/Y6JliP+HgzHsCRKQ/Ie7ZjcFeg
	 JE5JWufBBQNKzyYAXCK/chrp3gTmLCN4589N1H73F7+RIQ3cTh0t463zc2QDv8WAGWl4f
	 DEDHM09GXzoIerDodMkajFovWk/os51q3zcY9Vyuh+hCMXZDASAAxC9coVW9lD/n5uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="yiSDb/TS";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B758606A31B;
	Wed,  4 Nov 2026 00:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B758606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yiSDb/TS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=+sUJ84Ka0ak0v8/OB1wtWzXzCPWXpeiQ6G3/ZQmSqnU=; b=yiSDb/TSUvtV2HwSKzUjJWtPuf
	4r5/XTmbyRXBwSG4zzmoBv63mUIaVkLon7omyVUS5wqtGMEKDV051nPXVp6sMCt9+0p8bykeC0MA5
	Ddd3AJR+Am8I3oS8ryQXN1lG4+DALTLWaaOd/LY8roYcmWT0NnthT6S30iQJUQgergdpuYyFn3AIR
	EFO1d5cdppD1LANDi3GvbpVCBkVWgbJdnbwOxOBwEDZwCgsVRnUW5FG1DY7KZHiNXCvZYKf0Gmd9G
	uT/9r3cxsoUSMPiJ8hyZg4wnxz4GOAYrgf9gRQjs0InyYAIOBSPSyke0k04f+jdOC6AzwsdxiUlAP
	RqGYUCvw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPBb-000000041FA-1qeR;
	Wed, 04 Nov 2026 00:49:07 +0000
Message-ID: <d235a1f4-9bd1-4d28-ad6e-bcf1d4529c5b@infradead.org>
Date: Tue, 3 Nov 2026 16:49:06 -0800
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
Subject: Re: [PATCH] Documentation: add a history of the Kconfig language
To: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, mchehab+huawei@kernel.org,
 jani.nikula@intel.com, tj@kernel.org, grahamr@qti.qualcomm.com,
 officialnaumansabir@gmail.com, nico@fluxnic.net,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261103190832.3861337-1-julianbraha@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261103190832.3861337-1-julianbraha@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/3/26 11:08 AM, Julian Braha wrote:
> +6.18
> +----
> +
> +**Syntax and semantics**:
> +
> +- add ``transitional`` to specify that an option should no longer be written to
> +  the output ``.config`` file. (f9afce4f32e9 and 0902b3cb23ce)

FWIW, this also replaces using
	depends on OPTION1 {<=, >=} OPTION2
that has been used/preferred in a few instances.

./fs/cramfs/Kconfig:	depends on CRAMFS && CRAMFS <= MTD

./drivers/acpi/apei/Kconfig:	depends on CXL_BUS && CXL_BUS <= ACPI_APEI_EINJ
./drivers/net/ethernet/sfc/Kconfig:	depends on SFC && CXL_MEM >= SFC
./drivers/cxl/Kconfig:	depends on EDAC >= CXL_BUS

./security/keys/trusted-keys/Kconfig:	depends on TCG_TPM >= TRUSTED_KEYS
./security/keys/trusted-keys/Kconfig:	depends on TEE >= TRUSTED_KEYS
./security/keys/trusted-keys/Kconfig:	depends on CRYPTO_DEV_FSL_CAAM_JR >= TRUSTED_KEYS
./security/keys/trusted-keys/Kconfig:	depends on CRYPTO_DEV_MXS_DCP >= TRUSTED_KEYS
./security/keys/trusted-keys/Kconfig:	depends on PSERIES_PLPKS >= TRUSTED_KEYS


-- 
~Randy

