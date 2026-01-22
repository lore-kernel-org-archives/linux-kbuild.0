Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64397346783;
	Thu, 22 Jan 2026 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769091167; cv=none; b=UlX1JUKLlLmomd0kkyRom4AR7mp07yix4o/qhpa2h7N1GPFRmhoZ5U5rac8EeAe/RupSwLts0pLSmXBFFJwHv9DE5jK6vIcY8VGdIz9iqokYvbd0saVSQK/wBc64DrwPVgHfqxfCJhODa0h3y+W+rVyDvqXGPWwuG2nYY0cY2/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769091167; c=relaxed/simple;
	bh=wzrWZONN0g0i/0QMIJkZUesL28UiHeJmChyicBmIJe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=tZXjFw5qS9guX9G7qHoXQ0Z83vsq98TtMPa4daicp/+kwkXC+38TyoRQukwGkQQ6aw2W0MV24t2Q2m1wc+cY7OpJZXAsV1GbtBxF07xh/p3kShSIK4jS39JAYvWZBIQkrZmQWgn6ODy7dOG4o8XO7hGis71mHgrEfonT7tbQiJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=LjnjtaSx; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="LjnjtaSx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A375D1F68D;
	Thu, 22 Jan 2026 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1769091158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=feu6LdfEQ+ZmdChIaUrwSCIQwt4yhtPn4kVodzVkk2o=;
	b=LjnjtaSxdVP8j3Ub9fyF6kVSu1PCuVMFR1FUoe9KLzeW2Sq9B0H1Za9QzxpSA+YOW31/e1
	lVleUQ5d7nGY3RVGd85MXGvrZSedW/VwtIlh2xOvfsxrMavBnd/3FJFihP8gSBD69UNJ0w
	3JU+K3BKxhr6l1CajZZXwTho8eGb9q35sRPbQhdjdOLGiNAsgBLM+TnGDHn+qhpt7WHIC0
	DTA33uou+0MLBY2tv+fL+GO1pIeVRZQ+atNyMoZ8URAUmcSW1Gg+bw83DUaGlhrawuGofn
	EI7gnSTD6773ynlZCNm7MslM1t6sAv7Txzu0GckJSlpN6ntxlMKYdUloxmB9lQ==
Message-ID: <56209dbc-2dbe-4f52-a703-bcbd9ed3e712@gtucker.io>
Date: Thu, 22 Jan 2026 15:12:36 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
To: Nicolas Schier <nsc@kernel.org>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
Content-Language: en-GB
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 workflows@vger.kernel.org, llvm@lists.linux.dev
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <aW-JJ5DT-LRSZkdF@derry.ads.avm.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeifeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfvefhohgjtgfgsehtjeertddtvdejnecuhfhrohhmpefiuhhilhhlrghumhgvucfvuhgtkhgvrhcuoehgthhutghkvghrsehgthhutghkvghrrdhioheqnecuggftrfgrthhtvghrnhepueehfefgtdelffdtgfeuhefghfduveefieffgfetueellefhkefffeeuvdeihfelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeegrgegtdemkeeivddtmedvieegsgemudgrfeehmegusgehgeemudefgegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeegrgegtdemkeeivddtmedvieegsgemudgrfeehmegusgehgeemudefgegvpdhhvghloheplgfkrfggieemvddttddumeekiedumeegrgegtdemkeeivddtmedvieegsgemudgrfeehmegusgehgeemudefgegvngdpmhgrihhlfhhrohhmpehgthhutghkvghrsehgthhutghkvghrrdhiohdpqhhiugepteefjeehffduhfeikeffpdhmohguvgepshhmthhpohhuthdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepnhhstgeskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghvihgughhofiesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihorhhksehonhhurhhoiihkrghnrdguvghvpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvg
X-GND-State: clean

Hi Nicolas,

On 20/01/2026 14:54, Nicolas Schier wrote:
> Out-of-source builds do not work on my system with podman.  If this is
> expected, I think it would be great to mention that somewhere in the
> documentation.

The v4 now mentions this and also includes a trick using bind-mount:

  mkdir -p $HOME/tmp/my-kernel-build
  mkdir -p build
  sudo mount --bind $HOME/tmp/my-kernel-build build
  scripts/container -i kernel.org/gcc -- make mrproper
  scripts/container -i kernel.org/gcc -- make O=build defconfig
  scripts/container -i kernel.org/gcc -- make O=build -j$(nproc)

Would this work for your use-case?  Directory names are entirely
arbitrary.  It's not ideal but might be good enough as a workaround
until this gets properly supported by the tool in a future version.

Cheers,
Guillaume

