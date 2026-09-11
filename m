Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F1442AFAC;
	Fri, 11 Sep 2026 19:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154661; cv=none; b=Z1XDTfNogOJ/dZjvzOQPXsPdr/9FBW06bBi5NVWr/JzZd6Hhc+9EoG+d68oYeKhvvefpHSAiEp5ewP4o9FcLxFYq2KIO6J2rho3dMz5zoLtO4ZgRgESs072uy3IN96WQBHbC6uiECNprvn4zEH1mA2EcaTQ0EWtJUsiff1F28Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154661; c=relaxed/simple;
	bh=CwMr37gEueTCNrUJe3xClKC4S6/KmY0OcPPZIaw3lCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC9U/QLg0pMqNi1NfZsYUlN3+DNMxMIQRqCHLDSqKAB2XCb742LLA7IcuTVdKfKvQrtwAbhGYDPyBL2eyiusI8XaQ/bNopM5/aUmWEkWGi8ghdI7oKRmHhvd1JqeAMX7tv4l6TrwA0x/VQA3gWd0e+m47kRPmqbtgzKoc+nI+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b=b4ZAxMla; arc=none smtp.client-ip=212.42.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fritz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fritz.com header.i=@fritz.com header.b="b4ZAxMla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fritz.com; s=mail;
	t=1789154651; bh=CwMr37gEueTCNrUJe3xClKC4S6/KmY0OcPPZIaw3lCY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4ZAxMlamU975pGX+AOjTrladZHmyI4MbvzySCeH4mmX8vf3yyika2wJwDHn8VAUM
	 vkmQXAdgHoiMiyUiJbadcBloZ0lzjAPGCt17BaVLXSrYc3qlTQU/x9YmSrjL5MknWJ
	 GU11l0CblEF1FGQ12yxCPW+8Zb8R3Tsb7iOUpEyLA/+MrkbO/Am2/nDbB5q2epP2Wl
	 XxefS0eFcuUxP2a1/mc3Bkg6c09eQc0mh7rSDrskh7Ezf0Rc5QD8v1oL0GE69ayYw8
	 oznSNZ3B/24NeoclDm4yqzgAoI9lqp2XT9TtXerdK7MXfs3zVAqEHZ6YugaavY+LNt
	 3hnqhciHKzh2Q==
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6aa4555b-ea3f-7f0000032729-7f000001e1d2-1
	for <multiple-recipients>; Fri, 11 Sep 2026 21:24:11 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Fri, 11 Sep 2026 21:24:11 +0200 (CEST)
Date: Fri, 11 Sep 2026 21:24:09 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>, ebpf@linuxfoundation.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: Re: [PATCH] kbuild: drop dependency on .config for tools/
Message-ID: <20260911-rousing-delicate-tapir-e86a59@l-nschier-aarch64>
References: <20260911-tools-build-output-v1-1-4f9938a4f83c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-tools-build-output-v1-1-4f9938a4f83c@bootlin.com>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1789154651-264C4720-A37F6CEB/0/0
X-purgate-type: clean
X-purgate-size: 997
X-Notice: Whitelisted
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: host: postfix-mx-02  mail-id: 2CB1FA0497  external: no

On Fri, Sep 11, 2026 at 12:42:33PM +0200, Alexis Lothoré (eBPF Foundation) wrote:
> When trying to build some tooling from tools/ in an unconfigured kernel
> tree, the build fails to start because of missing .config:
> 
>   $ make tools/bpf
>   ***
>   *** Configuration file ".config" not found!
>   ***
>   *** Please run some configurator (e.g. "make oldconfig" or
>   *** "make menuconfig" or "make xconfig").
>   ***
>   /home/alexis/src/linux/Makefile:810: include/config/auto.conf: No such file or directory
>   make[1]: *** [/home/alexis/src/linux/Makefile:892: .config] Error 1
>   make: *** [Makefile:248: __sub-make] Error 2
> 
> The failure is due to the tools/<foo> targets having need-config=1 set.
> With a proper .config present, a standard `make tools/bpf` works, but:
>   - those tools don't need a .config to build and run, they are built
>     independently of the kernel configuration

Doesn't tools/testing/ need a kernel configuration?

-- 
Nicolas
