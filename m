Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BDB3FC9
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 20:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201159; cv=none; b=E2aVXoLK/bwpuMzi0qT+UWw2gwufTrFzkdjcsFELFDJwdDdbO3cKRLvV6FzHQi+pDIj90k059qCfdekVeGgTtfFPN6DVaMot6CIS7v4dxIkjh6H8oxfNn3A3p15ira40A25rAWIsv7/70cKv/t6ccqZD+gWqW8t46S8hf4dQtTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201159; c=relaxed/simple;
	bh=nMHxifEKj2ybh++crEgO5iwwhEfsCUHhxU1zIH4w6D0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ugPqd1LIXU//PBhXICGFdPEpHUhpJDFxSpWUKLw560CXq7b8osEjdZbOSpfJ6uMG0///O5i3nmtPnlFuExCplzQQdztvj9cD/45f1hOWkf+1vkcaIRr2GE1d+FD9EikQ9+UOg3/+D88RMcXMCQHVG5+6stWXrReXLurj4O95Bpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=SHC9Feq4; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="SHC9Feq4"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2419944317;
	Fri, 23 Jan 2026 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769201156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dbQUX0HjkFiG2wbIdbQj02t8Oh0OsYT50qtnqxWjo6c=;
	b=SHC9Feq4taN0SyVip3EYrdJYfecPNdpjlAfrkLRBnCFrksDzM9SrdIpHhmSfV+OuMVDLNC
	xRnu+1/jCin+9KO65V2J8Q4XNW4/0kA+RsLy2Zn0UZvkULx60H/aSSwbrTgEBBCuKHK13h
	9FGll9LNN5BBFEH877c90h9nq6hAjg+RxNiG+Ci+PIAERluOFyQrxyScd3a21wjKxdxMK1
	pGlY/i3hjR1r85C0OIT7acw3IvNnlpfiFfiGNmhsrHzB/slLj+qqkX+tDo54ocARnp87l9
	Q/SCbLVRtmIKH+EkFXD6SQ1LAXJ5tzf3LolMXVg8DpUS3XlvzInTXzi6C+LcDQ==
Message-ID: <6cb56f1e-f888-4249-8c55-a01d18606307@gtucker.io>
Date: Fri, 23 Jan 2026 21:45:55 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] scripts/container: Use iterable unpacking for
 _get_opts()
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
 <20260122-scripts-container-ruff-fixes-v1-3-fd1b928c3f10@kernel.org>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-3-fd1b928c3f10@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduhedttdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedutdelveekjeeuudeiffffkefgvddvjeeuhfehhefgffekkeejheekkeefuefgieenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepvdegudelleeggeefudejpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepfedprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg

On 23/01/2026 12:27 am, Nathan Chancellor wrote:
> -        return super()._get_opts(container_name) + [
> +        return [
> +            *super()._get_opts(container_name),
>               '--user', f'{self._uid}:{self._gid}'
>           ]

My last 2¢ - Yes it's more efficient to build the list in one go but
I find it easier to read and maintain with the + [...options...]
syntax.  I guess it's hard to tell a linter that sometimes, runtime
performance isn't so important.

These are all minor things but they come with interesting language
implications so I thought it was worth a few comments...

Cheers,
Guillaume

