Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883750;
	b=PvdLkKWGlku46z83Qi4qPCgjmCB6gU59/bh9xt/qcwQEuykcwljYCNN3t0MHHMz+0sxa
	 sh24fV9lAlFEhAbpDTjasuqW6/9C7mpZp2Gju1vlwLYM90XPRF6W/h5tHzlXMX3CyaVbk
	 5JhJTUHEkiTLHhcxnpq6Vtil1RqAYLHgh5pXKf/NLlMXHeQ5oIJlfwYEZNYVFvWoC5xWI
	 9iKm0bdH16K/pc3xzy0yQ4zlqxInxOwdn2C/X5sQb3Itsu54l/sL1Kp59eO+J8lBRhSdY
	 q1EBCx83xTOvbVsRVw1cR9JJKbcr6NLL3YOl1ICTVj1wkhVfqZ28fUAkygSEY0fBLdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=Wewkyk9TATizD3Oep/9uIj5UC0OWeev3JfA7KWDoEeA=;
	b=rC9ne8wq/pHI/2OoCMJ8/1EPTRMRTYYFN1OgJcOyJzZ9BHJ4c8zyWX3M8vscSJq+4WnE
	 Qf/UjqaPL10ioW1OJfQBS3UN2E1LRjKr2F0Uav0Qkm/Owyyg7XClOw0TykuHwvalYacyZ
	 rXbhnLHhcuoo24pBTaxAgU2ZkbjoT1hNPlSZGe+pxtTKNP39g5bVRZFBxxGyCkgKaQOQR
	 kQMcUPxMQ8qYfVNM7qyxqvFhtPriPTVKSwC9UKkYFLMX6BVMdN2YqFWlAJlqPYXSsa81c
	 OBl3R07WeP1j0fpVIW/Ce8nkQa2LymQ4zlUVJVsPm6VXd7EUzBVjxYwlWxhOLKjapJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=daylightlinux.ch;
	spf=pass smtp.mailfrom=daylightlinux.ch;
	dkim=pass header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=IN7vBtZW;
	arc=none smtp.remote-ip=185.125.25.12
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B770606A328
	for <linux-kbuild@vger.kernel.org>; Thu,  5 Nov 2026 13:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B770606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=IN7vBtZW
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jL2XG38cvzbhf;
	Thu,  5 Nov 2026 14:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793883742;
	bh=Wewkyk9TATizD3Oep/9uIj5UC0OWeev3JfA7KWDoEeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IN7vBtZWFhtIOcM/pN7dDgzwiNS2rMzvfbprlYQmX6QPSg0mqbYqp+Qy5ClC6ybei
	 4BA0/dnwLS7ucbVnXtHoBsomzOG25uD7VbyDIB4RAIXGD7w+ROlFWGPrqMjt87maR4
	 GsmBMMlKUmrabmQr+hiRpfCE7rV7+9D6g7Ut8ya+Fel++NPVTwaoHZWpxGsGsjLfEG
	 7v3sMM4uDOOub4tAWxzuUXaL2HlawLQrS6gE21pXLuD+5uwT2HJYMr2IxVl/9om0Fe
	 4IXbDNOl8xBQAFxDVtM1aaQS4wGxnPpwLgwAIkN9Tu8PctlRwPJOfvTuJcFgLat/sd
	 DmSs+opQUPh1g==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jL2XF5SWhzHdS;
	Thu,  5 Nov 2026 14:02:21 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOx6j-0005aa-19;
	Thu, 05 Nov 2026 14:02:21 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hamdy.aea@protonmail.com
Subject: Re: [PATCH v3] scripts: check-function-names: propagate nm failures
Date: Thu,  5 Nov 2026 14:02:20 +0100
Message-ID: <20261105130220.69772-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104232616.GB3581619@ax162>
References: <20261104120357.7007-1-info@daylightlinux.ch> <20261104120733.7633-1-info@daylightlinux.ch> <20261104232616.GB3581619@ax162>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi Nathan,

Thanks for the review. I checked the vmlinux.o rule and tested with GNU binutils 2.47.

A valid object linked successfully with ld -r and was read successfully by nm. For malformed and truncated objects, I could not reproduce nm failing while ld accepted the same input: bad-format and malformed symbol-table objects failed in both tools, while truncated objects were rejected by ld.

I also tested a wrapper that runs nm successfully and then returns an error. That confirms the shell pipeline masks a failing command status, but it does not reproduce a real nm failure on a valid vmlinux.o.

I have not found the build scenario you asked for, so I am withdrawing this patch.

Regards,
Hamdy
