Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792460393;
	b=Sb0xvdXdTuFfXTIycPYwkAU21nOrHfVv4SmyI1IiOV5T5TVWst+Uo52ST+EeZwK7h7wO
	 qmdN9Oeys+SxJS2HrQPAezDyi7LVNDEGdE7nhomehZqKbkznMgY9pgWhM1MBIFk2TUc+3
	 I5U2+NoQs0qiyQKbafKXHv6T7TRCuLDpksPG7eE6cdDPgukJIsaUopmhdm/4twUDEvi62
	 lTJcyWQ0hDxcSuYt0zhfmfl1svKHb5412fLuz2Dd1HkFrZE58J1SzZ+gtJ/spxxPdg3DR
	 3refdGFI+pqzvGbXYssIIHxe+K/hSlsNUlviBgjoFGG/KP56JdQzwnxctbMqXYDbUSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460393;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vxsb/WpL3qERRSDlEO8PKaIuwuK5A/Tf0QcHuG6ZXDc=;
	b=1bnat7tStZnsyE2GD8cZXKPdUrCD140N/41t6X7fYzoy+guyTfG+NI9j3pmoH4UGpUOw
	 eV21sDXXFC87SdSDDJkJk8oP7fRbOlZSzkIOchRgQAYFw5uJQ0t1ZuSfOwoWSena48xji
	 /sjKXw2WA8LANb6vBMj/mrgrAeuXFPRs6n7GWec9Nrq3+uu9J1hCd2AQG0zAuAhGBZ53l
	 3fCswlWG/WfMavXPo9KdMdYcH7DMOu0vk5SE/CoXvhCRDC7KM1Zn4am9iQX+dMzPX5zL0
	 ECalXLQD4pHMt2rJWQe86VL3XX/X5gL9UWXN7+toJoPt9dfxKsbg3anw/qoalEqLV5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BnfMj9KZ;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804D8606A320
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Oct 2026 01:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804D8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BnfMj9KZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vxsb/WpL3qERRSDlEO8PKaIuwuK5A/Tf0QcHuG6ZXDc=; b=BnfMj9KZwEWIVIqqZeyzI9BKQt
	jgLeTVG6vueK7UIfBbAe4QdeQF2/s0RhI05KtGleiFKIrLWXPtNHy5RjQaxR8B8HLxIS4Y0tyygiR
	pvb6GoDidVxypo8RI3uEAiJU7sEIBXCiF4XGhOJI1WJubmq3ub0tMW1Czor436qDgv1Ty8vV+6dm1
	M/qE0B2F57TYPVFfXiZ8zpTNfCgsJ69MegcgPMsM7T60LDSW5YkL1e6ZO/t5KT2IhY6TmXAoaLDHL
	ue89vcB2WB/0Gs8r72jj89ll9aciR1d5t2YkNXShmEurM3yG1lGhd+yWnafpKu8K2YhjMghvLnosx
	BoKeSxRQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIypT-00000008dHY-2QXW;
	Tue, 20 Oct 2026 01:39:51 +0000
Message-ID: <3a41965d-1985-4c87-acfa-9b5c3f573139@infradead.org>
Date: Mon, 19 Oct 2026 18:39:51 -0700
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
Subject: Re: [PATCH] kbuild: improve sanity check for ARCH variable on x86
To: Cao Jin <pino.cao2022@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
References: <20261020001738.2607318-1-pino.cao2022@gmail.com>
 <20261020003625.GA787785@ax162>
 <3f05fea2-7843-4738-9d58-b245645791ab@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <3f05fea2-7843-4738-9d58-b245645791ab@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/19/26 6:33 PM, Cao Jin wrote:
> 
> 
> On 10/19/26 5:36 PM, Nathan Chancellor wrote:
>> On Mon, Oct 19, 2026 at 05:17:38PM -0700, Cao Jin wrote:
>>> When building for x86, ARCH=i{4,5,6}86 and x86_32 will fail the build.
>>
>> Thanks for the patch. Where is it documented that these other options
>> are valid? It seems like this is just expected behavior because these
>> are not valid values for setting ARCH for x86. At the very least, I
>> think something like this needs to be acked by the x86 folks.
>>
> 
> Forget to mention, "i386" & "x86_64" are not valid value for ARCH for x86 either, the top Makefile correct them to "x86". So we may want to correct all other possible invalid value for x86 ARCH, if my understanding of i{3,4,5,6}86 are the same for 32-bit x86 were right.

They are documented aliases for x86.

-- 
~Randy

