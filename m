Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211776;
	b=LyYHs+idYL3vwa0s7mlqwBKzbXLF0AEbfo3GG0lfBylKivs9W0efXdWBzaG+FvD6Wt78
	 ZD0cKhsWqgGIWZ3kxBFdYmHNF/flR7YCmXXwiuTCgq55s4goqeoVkkg+U4CZCiMwRWSCv
	 mgeCeEdjNqgPeCFP5UpBf0Dbj8ykNea0x1kgqbXXdzvbXpnYA5vdoh/TP4NaU8ZLYkCqi
	 XCtju5IcWVDutlzRgCi/Vv2b5NT5lTL2zGN4SzSF5J6V0+Oj8DxbNVoje5jIAOoWa7FtL
	 NCigedJNEtzB3FhOgsOyf8fpqJcrqln6+9o3u6f6ufBW/FzGs0mV+YzoR2dogJQ1QpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=JsDKGMOU9swp0GAHJV/6e1W8mjoZhe2ZCwScsI7P9n0=;
	b=2IJauWT2N6uoNNDggtkULMCnZSwFL/YZrxSgcC7VK6DJ1q8UVvUykPQlXucDBFcQKBDk
	 k6PXnw2ro0NhzpQ4WQ0LCj7pUc1koBDULb4y+eeMNgg9A8bV9iRozWEp2bxku42icBhMj
	 y5NnlEVv2PJSeaUiGmENBnjYCp1vmqqsgZd7AjXSgp3tKOguwpCSa2SNWYte0funnHKhY
	 3JZPlFc8bzaCXLAwTdxbxCaM73dJDOgCRGbxsLclZsECGSEL6UsreI+SvrUXAMuwAZeYl
	 UsY0FjI0yUoM1UEOIoDz7oYSyk6FKjGJ5iDLTxuX7vTSrbnazwdF1mYxE9nxkk3p8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsJMeHUs;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4324B606A326
	for <linux-kbuild@vger.kernel.org>; Mon,  9 Nov 2026 08:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4324B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vsJMeHUs
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36fb88ea38cso817489eec.1
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Nov 2026 00:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211775; x=1794816575; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsDKGMOU9swp0GAHJV/6e1W8mjoZhe2ZCwScsI7P9n0=;
        b=vsJMeHUsuLmuwRFGQWjqexyf0lMs+FFMbp3YzxktWX9Z7Hfi6YU9iNvv99NilaFmcx
         xXZHfM2uVf0gfScXZEPRmTsPR3HA2Kypv3FxakX8i6MaX7QobwzarLkVMb5mpJcsL2/O
         36mMZm/x8VV9jOsWP4EKWkW3PqNh6LwEYAcY8iwXDDLu5tuH7e4IFIzYxOiG7ATzUeSG
         Pf6bpFOpzZ+47UMY2JH8+Vmn7MWhPq2EFybf6Ymu2SNTcUfCaY4XpOv40hnz8qbKrAiX
         gvFPjcCmSohdpDRIK2GPMUPUXhHYK2j0wnWNkDq8MqTkKsNv0c1MyzdPjck7tTFoA2ER
         RhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211775; x=1794816575;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JsDKGMOU9swp0GAHJV/6e1W8mjoZhe2ZCwScsI7P9n0=;
        b=xA+iUFS+fbVa/0CYLcVIdeLNGUrLF5P+cvwJXUnZHSrZCEbRMZFbJKOmJSc7ZRqRdM
         BUuFBL7p3XxkuWbX6ulBJpUzUiPhgXEdMlZse5TEguVILoMtOBSjkFUuDREekIcXvU0j
         Uh7IiNMl2IVEASD6GNFjtMY8By1lZmTZnJ95oPTViCZ/PX1oLv8rJU7z/5+cD4H9MF8o
         sLbgQSDRy0VggAI6jcIsAnG+z/8lrcMpgg+pC6qaMo1mhrGjTMLHNaeh54q+zcGm4xnH
         LL/TEzJOpmMIFGqpwHlnUtIHwj7DmDDIeleqMxyvZqxaX5VyfIEjWbNhmDFZIQ7WUxJ9
         1FJg==
X-Forwarded-Encrypted: i=1; AL+hErFnSZ0JWrTsDBuR7n7K3E/Ad1iNtvUvoqe+rQIWS13w8SOH6c3BiHoU0yZAGV1xJH9IHfUPjsqHejJg0z8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UasVvK/eakt9yV2wL4MY9NntEE9A9zkGQbdKt+19m9UYXNOMB
	zArmEgngSK4e2bGOL+i90Aw085QqXVM2nHrVanted9UNGK32dSGDbFKI
X-Gm-Gg: AYBFou0uammcdwe8z8DwRkWHnWBpl9coWgzVnZI3hhnzkcui2rvVRb6vGMwn+OrTH4v
	giWrs29URPE5FPsFv7PznfqAJqmw68K/9SZJhUIxwg0tBhjQDbFWx/XJWK3CfHn2FBSULt1w/nm
	lOC1pyrMJbmLbcdUkdY3Z9EDuEQHrBoCwkO4Rfg6uv8R+j7mKgyFO8jGplYuXEJJYPNQ7G2PZP+
	nhHZJPVHXSRZEf7HujrV8kkj2xvgXtHL/608X96F7RjLwmYZT2PHGS0pC/xx/zXIXnjGbCQB9iK
	/m4i00azXQ7B4RwZUjEarrmUH10IC7Df1Utjiz9miUcZxLMfBRx2Yd/9gVQmqsf0lDxWp1DTnXy
	HXrNN5FyfBbQ2OpZ9w6ieC1sdkFlB4rPAIZyU9AnPPCIjYTJM+d9USp75vTTeTnG6z24ksQdlIL
	/xRzSCuFLcjJueAPJdAYRREMU9n0sYL/5iCDN7qqmwGq2fWHkjVAlkaRZvoaBLMLmcl2J3DkihS
	6hECxHD2Zbp3fvchujIYw9yU18FcY/oL28exE4rDv0CgPgZjSomokIKoIJrcPZdov1ZWHGMyqTx
	uzjYxV9iBExkYpYwohf29XWWBxWjhO8IdzwNyf3k4sW+kVbskLKDWRrLZL+YxgT6zy2i
X-Received: by 2002:a05:7022:408b:b0:1a3:cbd7:1269 with SMTP id a92af1059eb24-1b39fedb95cmr5006800c88.23.1794211775040;
        Mon, 09 Nov 2026 00:09:35 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375728f8bsm10241765c88.15.2026.11.09.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:34 -0800 (PST)
Date: Mon, 09 Nov 2026 00:09:33 -0800
Message-ID: <e9cf3745ebc09bf04ce0bf75b67a31f0@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-input@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] Input: apm-power - Rename to apm-power-input
In-Reply-To: <20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org>
References: <20261109-apm-power-input-rename-v1-1-0609e7b91825@kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Nathan,

On Mon, Nov 09, 2026 at 01:25:26AM -0500, Nathan Chancellor wrote:
> When scripts/modules-check.sh is fixed to normalize the module's name
> like name-fix-token does in scripts/Makefile.lib before checking that it
> is unique [1], there is an error due to drivers/input/apm-power.ko and
> drivers/power/supply/apm_power.ko having the same module name.
...
> Rename drivers/input/apm-power.c to apm-power-input.c to make the module
> name unique and clear up the error.
...
> We would like to take [1] for 7.5 in kbuild-next, so we would appreciate
> an ack to take this directly or a stable branch that we can pull in.

drivers/input/apm-power.c only reacts to EV_PWR/KEY_SUSPEND input events
to queue APM_USER_SUSPEND via APM emulation. The only in-tree users that
generate those events are the legacy Sharp Zaurus ARM machines
(spitz/borzoi/akita on PXA alongside SHARPSL_PM, and collie on SA1100
via locomokbd). None of them were converted to Device Tree, both
mach-pxa board files and mach-sa1100 were marked deprecated in 7.3, and
Arnd (added to Cc) already has their removal queued up for 7.5 after
holding it back from 7.4 LTS:

https://lore.kernel.org/r/e4da2f9d-d3b9-4267-9b64-b0f2cb43402a@app.fastmail.com

None of the remaining ARM platforms or other APM_EMULATION targets emit
EV_PWR input events or enable CONFIG_INPUT_APMPOWER (and pxa_defconfig
already dropped CONFIG_PXA_SHARPSL in commit cc7852314abd, leaving
CONFIG_INPUT_APMPOWER inert there).

Since you are targeting 7.5 for the modules-check change anyway, let's
just drop drivers/input/apm-power.c altogether instead of renaming a
module whose last users are going away in the same cycle. I will send
out a removal patch shortly, and either you can take it directly through
kbuild-next or I can put it on an immutable branch for you to pull.

Thanks.

-- 
Dmitry
