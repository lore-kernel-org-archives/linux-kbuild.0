Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753393;
	b=sILcVVsIxBML90YN2CDRI1V+42hDpuT0+yorKA3dD62Df5tz99MKxHOF4w4G7Xe3Poay
	 vx/HWMmCO5Nq9pw1B+fYOYhr+sj1z0FDXn5WCB89hxIRZPg3/cvMt7N4gWb6k41Fpz12o
	 mARYPjPqYHrPbjzE6SCLIzfHMtB0NYDQIpk4dsFE1K5O244t6tBawaljF+WvA5SHjJraM
	 YYZxij5PRVG+Y1THM6C+nuqLWD9pe4AzsbCAlaHQvzD6XJP7AkeEvJn+XXAz376ncwdBa
	 YANcPu+rweK1pq8sYpy8onhFH7LZ7YWN7F7iGjvWRAPQUyO2F/CljLJ4eRThV8Uh4/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753393;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=JYosQIvaC9U228r+7ccVi5DMF70vAbn2sPRU/uPNBl0=;
	b=BF0r0jIs7hdjm0Y4alos6QTjtXJxpKh0TWAZ5p4vaf6VJ5uTyoT1ujY5Puuo6Xs2ToWg
	 8+rZgpPRna6VnKRNhHunjlnhZKHNbvkBhFTE68ch3BKzUrVZ9NTSPKeiG+bRtHas8qjvh
	 C3l+nDRK+OlZcxRPfNQGWh7EmwgA5axRV82v0whgYsG4SeXK5qOvoEgFsLham2wb7cZ+5
	 5nsFPZ4eMKoOUF1pWyqu9xeAaE8j3F2VSKwOKmi82oi6bzBzRoBlYiE0u43kDW0z/l3In
	 l/Ns2iiTl0pr6Ohh+KDo0+X8dWOa2UNiZudoe5VjZOEaRGEhJv3ZGE3PNpGE/OOLJKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L3cg+Bdy;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C6D606A32C;
	Wed,  4 Nov 2026 00:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26C6D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L3cg+Bdy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=JYosQIvaC9U228r+7ccVi5DMF70vAbn2sPRU/uPNBl0=; b=L3cg+BdybEStmVcdhVJ8PNFvz8
	MBRro2td6fpeXoZ3QDzFFNQcxDMPF5+AaifQBV1XSBo3wEqyqiNG2GF62NtfX/QuhGJcM9+A4JoVL
	TgB0mlNUSH+lCR2PPFjBvXLpTe3lf5JV08fMsFWtY/Mpos07Zg80HmgJCUmsukOf3wS2eBnt1vgaG
	32Qss+SFp44gbcw0JEnxus9UlnpspH+i8ztaI1x39S+QE3eiVUCKKMcbjwidmBlbaH3REvecRcBBa
	WlLrPC6G0y2REwzrY2flusTzBT1ObhcH42JzitGoNdZyBYc/9FaOEgeqG1jfiXwtaGctHkd5JqORM
	dU8PdKqw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOPCI-000000041JB-3FVd;
	Wed, 04 Nov 2026 00:49:50 +0000
Message-ID: <8bdd7a33-84c4-4cac-bce2-cedf6c6456ba@infradead.org>
Date: Tue, 3 Nov 2026 16:49:50 -0800
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



On 11/3/26 11:08 AM, Julian Braha wrote:
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  Documentation/kbuild/index.rst            |   1 +
>  Documentation/kbuild/kconfig-history.rst  | 615 ++++++++++++++++++++++
>  Documentation/kbuild/kconfig-language.rst |   3 +
>  3 files changed, 619 insertions(+)
>  create mode 100644 Documentation/kbuild/kconfig-history.rst

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
