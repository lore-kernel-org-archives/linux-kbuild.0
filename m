Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D8E244692;
	Thu,  6 Aug 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786020218; cv=none; b=RfGAI8Lwc2z2tW/otIbYlFhbScM6Rvq4ARlcPexw6Le9qFfyAz02n9mKAwYPzjLjLnpLYLD/mU1dLgSTgSp2RmHaiMraiej9888/pJcsXPjgSSEEH72I2wtNBS6cQgJ8VSNOayN0q7Xx8h6jek4X/jpQRTmylTSGmlvri9CnNIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786020218; c=relaxed/simple;
	bh=V8wGbZUtUTTvzd5sMok+xWhw6lTZggtI6ivctMLdN0I=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=SpBdWdtczYtdeBb7nxT6N6P5a38/2tEQSha58LiFxY2QajSyzNIj5BQyheb+bvCW6EixUC1GQsj+ATWYkywEjQDVo0kf+9xJEVkJcXfAvr/yNOzK720a0olyl+wxAgYi2QM37EBrsIEZtPAfJkvVJY4KZX4GY4KwFLzVtnz5jxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXGoKDRL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXGoKDRL"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 77EA61F000E9;
	Thu,  6 Aug 2026 12:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786020216;
	bh=uSkAoOw6V12txOsK42uldTLZWYp7dipZRGOana9YV5k=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cXGoKDRLdlqueJ9J0gjPY2lSJXPwL6s+daGsUqNtbOIHps3+D/gEc15EGeSWjeefx
	 KIXBTWzRq0p387X+O/Vw8WprtNVvxVAxOX7q3f7P1XGUzahTK5X6PEvq42Td/W8xKn
	 uv6PTc/VkxeRmZcq5SQHkVr3xR0IvuYgfpsrr8tLwDyenYHBIKSVPUpl+uaZJs/dPq
	 WTsfHle1NIjqLlPz/G7ePNVStTjberWK+42MyWde0v8VAin0A/QErI1cugjWFTisVE
	 cWz8rZtQ1JJTZyjrMFa594zN7mcEoBGxN2jyW/GSWWAu/nXJN9ZP4mfwkaFaxO5mIB
	 PmEz5uVMKOL4w==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] kconfig: fix submenu rendering of negative
 dependencies
From: Nicolas Schier <nsc@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, kees@kernel.org, xry111@xry111.site, 
 hyc.lee@gmail.com, jeffbai@aosc.io, vegard.nossum@oracle.com, 
 rdunlap@infradead.org, grahamr@qti.qualcomm.com, nico@fluxnic.net, 
 masahiroy@kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260801145238.2140291-1-julianbraha@gmail.com>
References: <20260801145238.2140291-1-julianbraha@gmail.com>
Date: Thu, 06 Aug 2026 14:37:25 +0200
Message-Id: <178601984547.3769299.10178477594396432625.b4-review@b4>
X-Mailer: b4 0.16-dev-5acee
X-Developer-Signature: v=1; a=openpgp-sha256; l=603; i=nsc@kernel.org;
 s=20250924; h=from:subject:message-id;
 bh=V8wGbZUtUTTvzd5sMok+xWhw6lTZggtI6ivctMLdN0I=;
 b=owEBbQKS/ZANAwAKAQdSCnAWJhJpAcsmYgBqdIAJaTtVG0I0erw9TlIWtqkUQQQCL9reyLQwl
 p6hh5fqf1WJAjMEAAEKAB0WIQSHQTenhzckp4G+wsYHUgpwFiYSaQUCanSACQAKCRAHUgpwFiYS
 abGkD/0dJiNMAjDTOLNcekjDo8mx9BFS2QuKI3Z61BEucfaybdzuI/28DwXePQbg/ut8U9uddy8
 RDu4ngi+hdpff8Kr3Iyjzvp/6cF0IVjksX/ujT1K7lIlD7vDSNv2s6msHiz2ztFvmXMqw4mYWoE
 xo/ryjfAyfdv5jBrQG7cQpPiOmA9UKYpCcjV7oawgs+wJCJYqKIeLygSofBymnUzPGBCQe4TnMz
 UP1cvI4ZxWSZUFt17GFY6u9eTjkPiTA0r+z6AT9hBp0/lSq7fFAI41AYTsSP3+hmTwwQJIF3uFC
 MTP68v3XvvuIqTW6q9drdHpAYyx7wA9KFqkfv4Z4kVCv7SMGPL3HFwmRZk5IMMqynW9FqPEOxu1
 cdLo2P3YdUV2GQWLcHhd0X3uG9mXcbwqq/lfqXqATXIQ41YSSADEEbd3KZgyY1i0c2AStAYzM51
 Q4h8RNS9PF0w6UcxSpAqvT3DU6Oh4zlAR5i+q5zvc5r8DSBTjy1UTZb0wA4tx42IXfX36I0GRNY
 2vpyeG7wUz6xX4r8qJQVGaWzRVzGWFHOw/GufR7joQjyYHvJ2FtYvqjnBrF3qoHw1PkNSOdbbVa
 iK4PKH/SNIHmOwrciwUTDopb4+oov1VPE7nQsub4Lah4jpK/3dYkXtaRJNflxAP781W3GlTggXU
 lemGScJ1SBiSpPw==
X-Developer-Key: i=nsc@kernel.org; a=openpgp;
 fpr=18ED52DBE34F860EE9FBC82B7D97093255A0CE7F

On Sat, 01 Aug 2026 15:52:38 +0100, Julian Braha <julianbraha@gmail.com> wrote:
> The Kconfig frontend should render options that depend on a
> previous option in the submenu of that previous option. But
> currently, this breaks for negative dependencies. For example,
> option FOO may be rendered in the submenu of option BAR, despite
> FOO actually depending on !BAR.
> 
> Let's fix this ironic rendering by modifying Kconfig to explicitly
> check negative dependencies.
> 
> [...]

Reviewed-by: Nicolas Schier <nsc@kernel.org>
Tested-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

