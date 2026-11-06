Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793935924;
	b=UgsJCSHXzs1boL7OKpzN6CP1d+p696emDgCPBERDU1xe1uaDFtmFaWsZQCZV8vPIya/k
	 tEn8chXO4zvRmHV4+0NwGcaQ0Bj5wZoLf2a8RitM64E2DhGnrTM5Y7TYgIruQqru2/TsB
	 48LtfBus3up7GY36fjpdjQduQV04tnzFsLIkFxnCmK5I4qo1QxJSK47Nj3Sr1ebHL9ZKh
	 sIEpZrVTzQZtRtIqoIa/76eTQ3EBYBCUBhcRCc79NqpbEAcQl0fTMdlKvTuCsai7H09n4
	 7wIPfkGFKx6jRQSi3eHghGl4Lv9NnxbcHXQXrF37xcRtHtapq3plReFuHENCFSHB+Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793935924;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LBBPFYG7+LoqIjDUS4QyqTdceDgufykIugDkx56Utl4=;
	b=Cf3RS5HP/6hHMTGUXWmoIYyIBascbC0nKMtpCMW7hj8OXK27rG1O6IEKco3AxHUwR4T5
	 S32pI0/5eSI+86DZLTEBAEHuWzu4Djc3hamKWuyOLzmWrFO4rdPuiNRRnsDs5qxpcIMVU
	 de2JsM2Ks7MLFLbZJUjkuvE0XGV60cL46DlCKfbax7FflZWtNGnZJ+ZlPX969qIzlnWHq
	 x0R3uA/N7FMMrLCDufaJmVT/DWgiD25xDmevvV96VIZfY2I9F/cRXS8eD6NF/3fPltI2/
	 9cu41uP6dkqFBv3ZqM35wRLJV+k6y8IvOlF5cYCrhA7T8DLNE9/IZ/M8teCxmlgHn0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3omHyXP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B42F606A31B;
	Fri,  6 Nov 2026 03:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3omHyXP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FED1F0089F;
	Fri,  6 Nov 2026 03:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793935923;
	bh=LBBPFYG7+LoqIjDUS4QyqTdceDgufykIugDkx56Utl4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=F3omHyXP/l2OWojp/VBC+g2cjyrYHMa4iMhGuluElB71qcAhclxzidq41QfBsy6eu
	 ogUGDaO2hMApJCzvkVxYsZUa5o5OjDYR9/l6tSQUFofmYXGigcyzOZwpfA6/uiDnKy
	 QtkndlTrDwCyVVwSCmwnI4zIqAmr4RIbcBVaKE/Z+Cz8bsvfKwrks/fAebt4nx2X2q
	 IOMANe1MwvY5/Xa4ZuWUQD2Zhfanr/tFLPX2BQ4r50nAtjYafwg6mcieS5FZaUIRjK
	 JPk67Bv3aIVKxXWi2FyKgmmqc/OfAnkH892GnD8qnHNVshH23u+NHUmd3R+VDcNXMp
	 uYE75QFQr+4/A==
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kbuild: detect module name collisions between '-' and
 '_'
From: Nathan Chancellor <nathan@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, hamdy.aea@protonmail.com
In-Reply-To: <20261103110411.11698-1-info@daylightlinux.ch>
References: <20261103110411.11698-1-info@daylightlinux.ch>
Date: Thu, 05 Nov 2026 20:31:51 -0700
Message-Id: <179393591106.309869.2814629602029032688.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=834; i=nathan@kernel.org;
 h=from:subject:message-id; bh=Jd2lX6hxG+ZsYFEJemIKVG8eCnkkc0/Zr9i7EqcNj7A=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlvvTTMX61verB8kYzxm3OyE82filwJn6++j73wjVnH+
 ksz4nJsO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBErM0ZGb5189WasD59sOnC
 jIeLD/pZ77OYL3OQPyZf46XWccv7DicYGXZXPbDcwZil03cv0Um+k3HFhOeHuLlenVoaPKVF9MC
 iudwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

> Kbuild converts hyphens to underscores in KBUILD_MODNAME, and the module
> loader treats both characters as equivalent. However, modules-check.sh
> compares module basenames without normalization. Consequently, modules
> named foo-bar.o and foo_bar.o pass the conflict check even though they
> have the same effective module name.
> 
> Normalize basenames before checking for duplicates, and use awk to show
> the original module paths in diagnostics. Preserve detection of exact
> duplicates and leave distinct names unaffected.
> 
> Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

Good catch, I was able to reproduce this type of miss. This resolves it.
I suppose this has been a problem since this patch was first merged?

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

-- 
Cheers,
Nathan

