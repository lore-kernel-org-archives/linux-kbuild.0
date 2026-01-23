Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD302EBBA1
	for <linux-kbuild@vger.kernel.org>; Fri, 23 Jan 2026 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769200730; cv=none; b=r8xQEhqOahLKUSYEimAOwaduHAL9qEQJZwgPMW2UZmqK22tgtN7cn0R8TZz8x8J+4qsSQvao1lCm1fdX5HJrRSmFPujqVkFqmHZA1aqCT09OHfqDeUU0loyhlYVYoM8NS8mUzKtiNLG0rDnJpwsSUJiTpUvKBUbwSj+i6M40UIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769200730; c=relaxed/simple;
	bh=JCi/SGh0RjwOeu7B+h8US8/79j53GNSPZtrSBiCQLAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZM+oteZLBf0EzP4g+DoOQptw1k1TZPTsiZgWWzU/WqLkffGaG54Zk96lC4LCLNt2ORXGNMVfNtxA3RZn8raZXLVtq2A7vQJPSmiv43ck76VbdUz8i4H/Ergs1WBzJcP0cPhaTrOXx8+LNJQvyYpQK5eN4eN9hJbb/eJcfp7/gQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=FDa3tdQf; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="FDa3tdQf"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A25B44345;
	Fri, 23 Jan 2026 20:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769200726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWc83wDxD8+ElBbLx+2g6MxuMfLjgOYmy8LJFMkQxzo=;
	b=FDa3tdQfLFeml9+amb56s/INM+hxa9YbgL4rirVbxfnYTi6AGZQtj3f4mJDC1u1m4xJHQ0
	l1xkdGVA9XcGrmDe9YEPeT5uX1aBwWZWLBn7iXqsRB8WGKaY9AxmAFcYyh9JlVbx5Nbssi
	knr3dtVIYSt8te8yFjXBQ0J2691Sk21sl3J5v9KkI8uxk0ByMMHHuZrXbIiEFU8yQzHG4K
	Atau7O9WwNrM+OfbjhuXPBIF6mqLvlZli5cgipFwCyBVG6Fn0q/Ju98PsUurZvpwXZaCxa
	aZ5j+YaF6tjSDbYUMYWmy9A6DU7aUV7wT2/qbFtqv0ghhS7k9l9Y7WPuqSR4Cw==
Message-ID: <a595bb8c-c9e1-43f2-ac7b-94f3176173e4@gtucker.io>
Date: Fri, 23 Jan 2026 21:38:45 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] scripts/container: Use list comprehension in
 get_names()
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org
References: <20260122-scripts-container-ruff-fixes-v1-0-fd1b928c3f10@kernel.org>
 <20260122-scripts-container-ruff-fixes-v1-2-fd1b928c3f10@kernel.org>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <20260122-scripts-container-ruff-fixes-v1-2-fd1b928c3f10@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduhedttddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepifhuihhllhgruhhmvgcuvfhutghkvghruceoghhtuhgtkhgvrhesghhtuhgtkhgvrhdrihhoqeenucggtffrrghtthgvrhhnpedutdelveekjeeuudeiffffkefgvddvjeeuhfehhefgffekkeejheekkeefuefgieenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmeejkegrsgemkehfkedumedvkeeludemgegsvgegngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepleetvdehueeggeefgeehpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepfedprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgp
 dhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg

On 23/01/2026 12:27 am, Nathan Chancellor wrote:
> -        return list(runtime.name for runtime in cls.runtimes)
> +        return [runtime.name for runtime in cls.runtimes]

My 2¢ - A generator is a generalisation of list comprehension, so
using [] is syntactic sugar for list().  I prefer to always spell out
the type explicitly with generators to avoid bad surprises with {}
which could be seen either as a set() or a dict().

Cheers,
Guillaume

