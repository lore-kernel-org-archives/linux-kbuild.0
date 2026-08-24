Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDB24048B1;
	Mon, 24 Aug 2026 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568935; cv=none; b=pjlyswrjAPzlU4j7W2+PjhsRniN32GagbJSOLF4Epq7kc1/iMAzzvbT3WhDsV3fXzKrJ1hzlPO+Sl5jJ/02G+lkTZgBivkrjEW7HEh/ZfWKzMl7i+M0wpG/JqOCwtA+xQAnRNQcG7UVx70QeA+gDv+2cvCaETZDtG+o/OlhfVZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568935; c=relaxed/simple;
	bh=Y7q7Y0Ijr81nht1B72jaufflBHfR+4lBnvpXhqwLMNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzSWshRIsEQafKxp6GumARo9mDcP4xjzrgOaQSlzPGuKkOkibDBQ3jMwe92FiG4eJ2BoBxE1E1xR/w9hjOqb16h1HfxcjTKZElRuXvVplv5iNSqmBBPQhub2uyBHAwvY3YHQnZUaaB86+5LpTENYIXls3bjHP54w1DP3553iS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=OXTtm5U9; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="OXTtm5U9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0175D3E97F;
	Mon, 24 Aug 2026 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787568926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFAQi+kBIPkmL5TMXRPYXiW26z6Ks1atuHVz2zpZ5ts=;
	b=OXTtm5U9juHSNzDcCwQuS2TZbeAH5X0WJmNc2PAwHUdE6O0SHGIxvrJqZe9y1z/ZQueca1
	5v4+/Wmns4+bnIldZGeBFb95aQj+fGu+nr44OpfP5ME22cKd/BJ7AJlRsBJy13cW2tL+CK
	9oRtHJyIFzq0pFIG1rdbVsAUIfGnM30WuYe1OuDyhKwIjLmeYqhIesvYgmJU5r9VHPyx/4
	rdEK8ETbyNd3cov4BDji4yhplkFzeJPiyaVd9lMrVpcLvwMDLntneCCAS7rRbqLPSx1jpw
	ccDrAGTrsoqrHbZsK7WLAgFvFsh8uHbnYkbVfnDhm9IvsLbYlHEuKRAZf+3sIQ==
Message-ID: <fa01a427-a73b-460b-9b11-d2e92cb8ea9a@gtucker.io>
Date: Mon, 24 Aug 2026 12:55:24 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: dev-tools: update container.rst with
 config file
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <13dc85e4d0b1b1f6fcfc7782238b137061f2dd7c.1787565460.git.gtucker@gtucker.io>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <13dc85e4d0b1b1f6fcfc7782238b137061f2dd7c.1787565460.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFm1MaMI2m/joxcKaeoOZCNrpHCicyrMcsWV2F/rKFb1kojbr/l+BF2aRIUgPETl/OJTTVBhN0qQuocJxskdg2d/PQs6OK6nmO8C2b1WVi5OXNqVjlJbrQPKpnFzsu3rGXmVfVQrxr58H4gDXjfL8hPuWQXVE+v8h8k+xWtwTczlIxylG1gHlytS3hRzxJl02wM+3ge6Fo9aHwtrARFjbUzt6wlGuydHMshHvLh4G7yY68CpHTznWaViLxEilo7kX+8QF+73Fy5BDiiZjR7lBzUjb3SVH98g2Q+k6tGbtElr2vgh9gY44r1Oifkp76C8+MnAyG5N4TbttmvNyxnYBR6EQu4lzWpng4Auq97oItXODDbaqvMZC5mCNN1sERByWyk0lYXjCbGOFL1xfZl6RVo3JUBxkTn7+6i1tkRu6CTi01bIpT/H+GYoyTdQUxyYS8yuap2zITaAR53DI3rcrCTo8iYLSdyROtQPkh4c6QGLtNuPgovJeMbwQU1Yxo3jSxKaOGW9fXDKynWRofOueZSv7/Kyg8p8hA3hYfCL41OnU/8IXRBt+bTo86SCr0EGOm8a4IxLhOaK24XilrKjbI61wSpMc2WVgRyDdCkCDe1AlaI3ldsZlkw9Ga5eCsgDCxsZKbTosHtkqDkOvSrIw1YgH4k0LrYPgpei4FlTRdnkw

On 24/08/2026 12:05, Guillaume Tucker wrote:
> +By default, the tool will look for configuration a file named
> +``.container.toml`` in the current working directory.  If not found, it will be

Sorry, a small typo crept in:

-By default, the tool will look for configuration a file named
+By default, the tool will look for a configuration file named

Guillaume

