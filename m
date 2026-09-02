Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9905F44BC92;
	Wed,  2 Sep 2026 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346829; cv=none; b=Hdp54jkwnnni+QHzrgw0DdJyrpclqccuukZie1z9Khwb1z01Qfv66cCg4TVBjJhUkygZirk8i3zvHXfzIxzqVkux2bYfhY+pOyhPF5ZXMetFHU5Qr/G6Wwx5/KBPjTDFeKioFDLR22Ugb4ctgXBFEPVlpr97URtK1VklcXfky/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346829; c=relaxed/simple;
	bh=CN1unyH/hIb+Y8YiaPvwEJCnakyQmFPwizdxVbaRSV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALOt+M3PI2G0Fb3wksJpEBfiwWl3QSRVcb//D2ARmpMKNR+7/kjyCXHd6pQ7BuWRcMzcs1rkZnD+nJPzQMnvoTh4ZdASZqj5tJASe02I6TNZmsyjYoOE6jYn7K0YRKBAIHJfBskboWv3lPAnZFDWgMf4mVaTIPdOWYJ4IXbLL10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=HsrqOuKS; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="HsrqOuKS"
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 1CBE7583620;
	Wed,  2 Sep 2026 09:37:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E9CC3EC34;
	Wed,  2 Sep 2026 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788341854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1+QrDuN7d/J1hIpiEah3cLGmlih4zk6g8I3G9jEmS8=;
	b=HsrqOuKSjlK+/HVReCnOiiq8ptX1fxavY6kKvmZ2cjQmNHFaFwhcAGvD9+aoIYmevL1qrd
	GyAVnH1ahdFnWBEpX9kH6dSO7OhIPOWy/lD1fXUpbVkjLHyOgpQUpzYvItYKW+tQOLNa6G
	PFjXri2X8VdlBrAf1OwpMcXlCKLvoB3wwq5l99Z1cZXcyRDKrY08CzXyp1lbxTGwUVs6Tp
	FFPPqL8zR1o4kBVo2rm22VnSDFDeX0OkoZuyltrn2a+NlwQ6BAdwctkN9zgiAFKcfKSGV8
	1ya7SD2rwB4aGfMD612BSX2nPUTCxwoPaM3QKplUnR556/k8hpNdH3jAYUbuFg==
Message-ID: <f90aa8e8-abc4-477f-ab52-839e42eadf70@gtucker.io>
Date: Wed, 2 Sep 2026 11:37:32 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] Documentation: dev-tools: update container.rst
 with config file
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 kernelci@lists.linux.dev, automated-testing@lists.yoctoproject.org
References: <570dac1c8d7a2befb5578cdd8a2ed63b3769c4c8.1788340031.git.gtucker@gtucker.io>
 <adc9eeb418f026ba2b18c4b2aa1e52443bf6f210.1788340031.git.gtucker@gtucker.io>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <adc9eeb418f026ba2b18c4b2aa1e52443bf6f210.1788340031.git.gtucker@gtucker.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: dmFkZTF9QjDxzIdrhTfD1WLDC2OkkzEhLpazCn/BC9x7TeIdF79s9sf4dKq1Asdkp0WYf4CviRn4UsoJdKkBWavV87Jvp2QSFU8TM3I3AeLJEl0u1IvNe9lYJsHepNnyTb/Cm1G5YCw7fJRMrqPk72ltvTJsURd5ummtwW6uZiFlUGd0adhnwWc5oL8raOL4ND1K3wwWFhE0/UfdoqWI7aFUEXG+HcjQuSZvG0LryZC5KN/pCn5x4TnAb/9bqTASmJsG0lOFbqRF2EdPlL9Jn2MDJWCeDQIiFvRa7i13mczooTnN6cr6saq61Q0C5P/7X+xnDBZ8zu0SQT9VV5nY2Drmpfu2RPuRWQxje5+roogoeIB5cPAzh5ecLBipDd6Xw0xiavZdd+qnIaNbKIGGXJmoulsDFOTEVbOv9HapQEbDJ0kM++GJyZTouHPwk9k4nV4VfWZJm9n7OYRxPgtxMGV284ldydigaaVgQ9W9oujb6bxXXG1YCWk44wiHkEJG0yOrsRPiftJYA0Uqzk8udb0jYfiAkLg7xWWRvoEHNIz9Gg1ji62gKjb+5Hez2LpRkZQg8BGU2hF3WnX5F1ZsaMF4T8ZydZAHcjpiS1M9lIBDnakW5+Jv76WZeWzraliacqf0j2QsQWMRTMB2N3U24Aw3aeNyNz0tYu4ig+v+IxE1KeJ+yA
X-GND-State: clean
X-GND-Score: -100

On 02/09/2026 11:07, Guillaume Tucker wrote:
>  ``-r, --runtime RUNTIME``
>  
>      Container runtime name.  Supported runtimes: ``docker``, ``podman``.
> @@ -53,8 +63,8 @@ Available options:
>  
>      User id to use inside the container.
>  
> -    If the ``-g`` option is not specified, the user id will also be used for
> -    the group id.
> +    If the ``-g`` option is not specified and no group id is defined in the
> +    configuration file, the user id will also be set as the group id.

This chunk didn't apply cleanly on top of v7.2 so I've resent the
series after a rebase on v7.3-rc1.  The rebase was trivial though.

Guillaume

