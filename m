Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBD379C56;
	Wed,  8 Jul 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526443; cv=none; b=ShGUftr29ECw1J0J2NPTkI2p6qHDabgusc3lhqA09SJstY2H9ACimJVHGCaAu3DxL4wuYcpvVsicarmvaWx7FAHHAcYUYWrDZHTpz7u4wDIUBSvukZ3l5b3A5HuyQvdzEznvHWfHE2Y9J71xvg0BpVWkAZj87twMiwF8innnrmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526443; c=relaxed/simple;
	bh=VGujGP5WfSGg1DBzhD2xC5nPhKvYpnC9HXOiuHjexUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K29vIKiQNlcKjC/gu0EgsM4lm98yklDnq6I5RrUl564YGjgug3l+K5TkTo5pE889QsjgXAdh+WCR/nW1U3+0G6WIvk/cdLETNQ59P58eqkPpVe/bGnR+4sOMWE7S0wWvcxJBURqnbmia8qR9kqrJ4L15rJNE2xUBk8AwN0zpE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BuUS5KN6; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BuUS5KN6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=68dI1IO9MWd8JysrUhD04sni/lC6RHAplfV11xsZtr4=; b=BuUS5KN6Mgd+JJPW384qWt0xn3
	+hTZz7viKUSQqK87c0E4c1mXK9hWYtlJXzJuZMVPFydIx7jIm9Na9NkDNwp9DYpR/8/rVeuHvSAPg
	mSMYtaOhhaQW1MzFS4/tvGbNDGH7e1nC8K6vnuDHf3EHM1A9mJdP20HSZJ6izyQhf1s2X8o2lRBXX
	yJH0hTeG2qfS1EZpGdLnu03C/0zfATk+2oJczlMdihunJzPhkUPyXnWeymE8rmAV3ije9vTB5/bxH
	5oIIxueD4cbGQXpH52/2h76kPmz2P/y6xEDNWH9n19HLoRdzDPO+NsouxIP0SVx3sbMvFeQpkN65l
	xDyz8tYg==;
Received: from 189-68-33-146.dsl.telesp.net.br ([189.68.33.146] helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1whUCU-00BmQO-Jy; Wed, 08 Jul 2026 17:28:38 +0200
Message-ID: <17d3c3f6-f040-45b9-adf7-6ef1d7cf4e3e@igalia.com>
Date: Wed, 8 Jul 2026 12:28:33 -0300
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Nam Cao <namcao@linutronix.de>,
 Andy Lutomirski <luto@kernel.org>, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Borislav Petkov
 <bp@alien8.de>, Nicolas Schier <nsc@kernel.org>, kernel-dev@igalia.com
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 08/07/2026 10:56, Thomas Weißschuh escreveu:
> Finding the debug version of the vDSO is not trivial as there is no common
> scheme where it is placed. That's especially problematic for CI testing.
> 
> The vDSO futex unlock mechanism requires for testing to have access to the
> inner labels of the unlock assembly, which are only accessible via the
> debug so.
> 
> Also for general debugging purposes it's convenient to have access to the
> debug vDSO at a well defined place.
> 
> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> regular 'make vdso_install' layout, including build-id symlinks to find
> the correct file for each process.
> 
> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> 
> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> explicit dependency to avoid errors due to concurrent builds.
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---

Thanks for your patch! Tested in arm64 (qemu) and it worked fine. I was 
just expecting that the file would be called "vdso.so.dbg", not "vdso.so".

Tested-by: André Almeida <andrealmeid@igalia.com>
