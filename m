Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359942;
	b=HROAOk/lNmwysR0+3H9VmL0pktlw1g+WlpN7MsM9PfQk70QCiFHHD/egE5n8iFzDyBsX
	 SWc/BPkYGW3PdB3SJuB1vCNyDuvso/JyBqzlwIv/wBZMskwcTyvXHBWu3kr43Xw7C3mhE
	 XWTh8y8wWHTNEcTkwHDGwgyexyjU+kEDnYQDr29lOmB7ZMJ/tPnTnDCDmEFR7qvThM0DU
	 NW6mJloVITQHW1KvI2zQI5csAcqW8OXXKn6FZ4fE6e9DIrOsDkhXpmJF5sVMecWDFkKXU
	 NkOJMqyCt6dHHDMDWlDuC7ok7ajIzyewLq6gAW43U8qJhhtc6K9kfytiaUvf/9kczow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=bCRXJOfL1rF+9fr+UKD9RmwMJVlMYUb3ngXZoi9U2Uw=;
	b=k0t42KEdJ/x9z3ox68Zfi9er9CCeh+QkGrXhBMiOwkpoAazqTqVc1nA8lDRymmUVcLqt
	 0NJaA4DcOiX6Jw20xazY56ogp6n8HL1OTLUQniJ+qGb+WitgISotOKfbOpC0DUtb95SNW
	 jOsM0Rpj6dyTIepHxTb/b/DCtp6h6dBpEDL0QwjkxHG0LO0Iw1/UdODlCp2LOhpF/Z5Hq
	 ZhPELoGsyvNGAn2sb3IYlidct2TCUg2zGL2GO13ewaCj2OnmCOH9egCD4Hg7ItvEXtu1D
	 UxYVeivYmPwmeYrwgEZgmOSW7Fa4FvtAPUwCRCpIvJ5dw4UfxjJXqHSAK5qs9y7uWlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w03xlHOL;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F99606A338
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 11:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F99606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w03xlHOL
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so3425245e9.0
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 04:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793359940; x=1793964740; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bCRXJOfL1rF+9fr+UKD9RmwMJVlMYUb3ngXZoi9U2Uw=;
        b=w03xlHOLF/X/r9/Qy7G4IHunwOFbxWFcuqCTaRy9YMih0FbCwFskjFyoQpFFKP/ylq
         g+ofcPtcLkburnrrfM2FkhCJb1Oi9InixLTIUp1KY3PbN739V6VmVuLwJfuj/Tki4Mqr
         rXjZHmvo3Qv/spuhAb3y0KfY6MDNUh4kk7fpeF74S2aJ1y8q+EB6sGQYjE4z1/ozFLWJ
         Gl1xbJKkgjS+ODriXEY/Vxkt2R4CGCLh82iHmVipcsj9o27kcqhF8i+KPyuP+S07aZbo
         aQh8yA+RmmEwum73ufUgZWDuXjO055n7E55+UIMNVLoOudSa8jG6nrkQus0/HGQi3uLs
         S0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359940; x=1793964740;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCRXJOfL1rF+9fr+UKD9RmwMJVlMYUb3ngXZoi9U2Uw=;
        b=TKnn3RYc1aUBsKS/4OmMv2Leqy+9KhP4Ul79NkGfHxXbeLbNv7uwWocn8eC0HlLGTn
         wcAZJVwfbXsMjHG5oTxtXu3jbXM/uJWvaG4vdEEfYG4aYPDi3oq1EUEaDFdQrW9O5mgM
         BPnmzUQJ0tqxM+sh9UGncpzQ6VPlMbkCrFCV1dWScqnM1QWVl5FDEIX79vvK8TvflJF4
         S1VfLR0YSbJffvhgs9DQi7t/ThNpTo6yea1UEG2xgf0HX31XhkOKdlyNRVKd349vm5Xj
         M2c3KGiUv4PD3+p8U6dTHujoNQeKf1fiM+pDnmm7WoPu9/uLUWYtq1Bknk0GSjTK2/T8
         QcDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtYNE5P8ppwhLC/lsv073wEie8/vN0/c4iP8T6A2DetoEX/8tQ0pnimZ257SZmAE4+KaZx1xrfB0iLKTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR8tnLvWbkep4zGty1w1OC2IFJRPaRPxc/oPL+KDG7dbxsKPo9
	c3cb3e2/yUviU9MnQsfVVa3YgaK+xAIaYowrx6XYXijLI0DimHvJDY6kXwUKRJPGNjU=
X-Gm-Gg: AYBFou1iog+VmIG1wrADhy0mHSlVO1WR4wv9t2PToHR+GYIFB3EhcFNcrM6UexflNvA
	N7Nq2Uu2RycucC9gmvXiy4zyYXgTZNwqegKc5z1nN4AyTRnwXKESbR8z1bxMFJ+AWEDOUp0gSQe
	lhgyyX8wKtuJrr+UJi3AC9SDc/8Ghrn8xVNg00NRIxSdtUZ1nMgfx79w6Wkn5DXVH8NeRtbyzuU
	ZbkGDoQulgU/mSJRRIX01D0e5x6CHUQySek38eStuG2XehphTyEOxKzYakoHCsolupJugcXulip
	DWKY4YdR3JMeXeQjzmOsLZtLTZF8/GUFeaNGVvJSSSrL0nr4ULe9+6q6zyRYOUBcIajHy0pdHIS
	+izwcJCipWQSMigLXXjSkVAvF3NFqcaCeqTuD2wDpO5ZF3xOOh9WsYF6pUK2c1XfL/g/onflPpc
	Tjt6mepQqub0cIAPEO/MVz17P9KjroXP0dGiw8wRXedDuctT1Rkq2dnGvE6N3CG8xT9ukgx0VCF
	Zd4b2E2Jaq/zV7F3j2exwPk7rfw/ka9nCDaIJ65wV2zhHRZ56DJ0CitGen1HbJuKP6/BqIX0P1g
	tCUDtGrTJK2dW7pilRK2ZIaJQ49IPltnrA==
X-Received: by 2002:a05:600c:4fd4:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ac180f2ff3mr40702125e9.17.1793359940297;
        Fri, 30 Oct 2026 04:32:20 -0700 (PDT)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm133071965e9.7.2026.10.30.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:32:19 -0700 (PDT)
Message-ID: <3e4f24686842918a3a340cab4a7cbeb7540b8a1e.camel@linaro.org>
Subject: Re: [PATCH 6.12.y] kbuild: link-vmlinux.sh: improve detection of
 third pass requirement
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Juan Yescas	 <jyescas@google.com>,
 linux-kbuild@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 kernel-team@android.com
Date: Fri, 30 Oct 2026 11:34:34 +0000
In-Reply-To: <20261030-linux-kallsyms-fix-6-12-v1-1-9c43c892de04@linaro.org>
References: <20261030-linux-kallsyms-fix-6-12-v1-1-9c43c892de04@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-10-30 at 11:29 +0000, Andr=C3=A9 Draszik wrote:
> xxUpstream 14b8b4bf2d7b cherry-picks cleanly onto 7.2; please apply it to
> the stable 7.2 tree as well.

Forgot to remove this stray comment from the v6.18 version. Please ignore
this line.


A.
