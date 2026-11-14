Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662153;
	b=VlQKLWFNqtHTJWl1gahtk5LP8t+7uwYQDA63h0YbS262JxtmEDAHWVUlqJR7C1ZW0lJu
	 J8IOBHOh8PjOCFbwsCTOg0H+Q2IcOdkTz92mmr7PC1gYcGPHqkXwDu/GQcwIefmzVin7l
	 oMgaGJUExhzCe0ZWp9H6XorSmhZHU6Z2HZRfKtgJHX2SGN6gnI2oM1R/iHS/q7pQwCAZl
	 +hfGJ899WqN7ISH1aYFpqWS4B0VPAtGgcg86fbcYjwTpzQZzOIYEYKLpf5l7dCsjXkW+T
	 e8arUis51SfZ+HfE+7VWKyf+TWbhZGQOrGgvvmCHzjT5/OPfQQBKMs39mmmzJb8ePPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662153;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-GND-Sasl:X-GND-Score:
	 X-GND-Cause:X-GND-State;
	bh=UBuyPxfkpGD+TN9xYc/6SdKxTT0pxjh+orcFTW1lF78=;
	b=P5528Q7EYxzBwIBHXQN/YYha47h9JBX0Id7Z4i8n2RqqEnnRGgj/2kr2SoRXR1DV4Efc
	 Pz50ntUOOrky7OI08Ow70Gl9qVBR7SL6ryc9dJPLQYbEQkdw0Xj3bPePGntkcTrZImEbb
	 2j1OONco6/7rBnum/AIsjDk6U9UnB5S4ZiV+1KDo0N/zNBYkDJhMwGCQt+LJekKXfe2Cq
	 HovE/d4IXlyVkEJqsaI0iEFQFkobgiK+FH1Hlh5N6hay/lF4VubaxhOxPr7UIVrxjOMX4
	 i1/QLqtNhQsDafOY+aUJpsj6RA0wWK/5zf1c0iX1nQh23V0gmIiPb0Y4RsTt3vQwxvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gtucker.io;
	spf=pass smtp.mailfrom=gtucker.io;
	dkim=pass header.d=gtucker.io header.i=@gtucker.io header.a=rsa-sha256 header.s=gm1 header.b="FyH3o/PA";
	arc=none smtp.remote-ip=217.70.183.196
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97342606A335;
	Sat, 14 Nov 2026 13:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97342606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gtucker.io header.i=@gtucker.io header.a=rsa-sha256 header.s=gm1 header.b=FyH3o/PA
Received: by mail.gandi.net (Postfix) with ESMTPSA id B51603EDB6;
	Sat, 14 Nov 2026 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1794662144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UBuyPxfkpGD+TN9xYc/6SdKxTT0pxjh+orcFTW1lF78=;
	b=FyH3o/PAXilxApaipvidfBBjonIe/VgR5HKWDXIGI/VXcfFfmZyL9Pa8WKV5slexGl1ZTI
	9UAOmBTtF1u0UgoN9MoiWppMbBCsTuRYrETqQ9mEkiB5rLulvV+c7EYZDfQ0RHGnxn8Tas
	4k6bNkizi6MGOTNgBqaIFZlVkcLPR9MX0bbdOQdPSmqmwxnSCDXtxvl/0ft41jL/yuvN+V
	yTXn/gg3zD8u8mSYce1xPxZRQMn8Q1yjNG6QTekow4C6DXRG2nQ1EmKSqZcc84L/ZP2aoi
	yxNwkusnodtnvsVSmv89nVg/s4HdEfxfBz3tTNP+/9WfwgjyMw3dVz5Mp8zccA==
Message-ID: <4756911d-1981-4edc-8c85-e45165f0fc59@gtucker.io>
Date: Sat, 14 Nov 2026 14:15:41 +0100
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add --registry option to container tool
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <06ee7c694c3e9716bff5c9b1b8e9dc95cc0b38d3.1791751900.git.gtucker@gtucker.io>
 <179385298671.826739.5987343385077824329.b4-review@b4>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <179385298671.826739.5987343385077824329.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTEosKJeFP+27beNxaiEZHskixttPg7g7iXs0p1k1tYJayIk5inh6w97znoi9hb8cCJrdIrjkTGRfXrra8Ix851B4APZNHqK+vTkwSWjKS+02tUJktRNce6mUdOZovDO3W7S/SBqbIiYz06kEL/FZ65Vxxgpys7lQtymdu+2oE92LemqoBa0ATHDnyrDgAVypdkbfFGOCeTJcsFVFcEhcizCbE93zoSJd45DmqUll2rG7Nlny/28xj7GSeiVwQZb9uVChT+TTOa7Uua6d+w/FwSg6hyPvOpujJdBFhEIx1Ndx4RO8r5dxBfw7I9M5GxAuQiLc0EvQh6vOYpq3/pM35AiX/gkoaJEa0QW5sW2Y1jGpkdxYK1JyezWm9wRhIT2PwH1q17sI5OwBppkkwu9Qa9PqJ2clGXtY7ameQEj5pri4/KhrOm4yz+o8PKCsTL9W7vTiQHW8sHLhxQ5+UD/h1v5k/joOfCWJ/Pl6jSP8GvZbpHWG0ewUHslrIR0n+57g6E1mXRGknTeM0ZccNvlJLsT/Fub1KAt3pygrpHW+sp1+kMJ7+XG6raj1LgK91q70TlAsw7gj6yMZuOeImHAIPvbCXjEMbThQG1QBe/A4YLIgtV3WTv2gcbrsRb97s0ClHwhkZOMl3ubNXGME4Viq0EYj33iyY/4arJKlF4Z6Bqj0Q
X-GND-State: clean

Hi Nathan,

On 05/11/2026 5:29 am, Nathan Chancellor wrote:
>> Add a --registry / -R command line argument to the container tool to
>> specify an altnerative image registry and support it in the TOML
>> configuration file accordingly.
>>
>> This uses a mechanism based on regular expressions to parse the
>> container registry and image names and construct the final one based
>> on a set of priority rules.  A registry can be included directly in an
>> image name; an empty string means a local image.  It can then be
>> overridden by explicitly specifying a registry name via the CLI option
>> or the TOML file, with the CLI option taking precedence as always.
>>
>> Signed-off-by: Guillaume Tucker <gtucker@gtucker.io>
> 
> Hi Guillaume,
> 
> I don't have any real strong opinions on the patch itself (although
> Sashiko seems to have its usual complaints about validation and such)
> but I am not sure the commit message or documentation make it very clear
> why it is useful to support this. In theory, the registry can be added
> to the image parameter, is that not sufficient?

Thanks for taking a look.  Yes, after taking a step back I tend to
agree with this too.  In fact it seems like doing the work for this
series helped prove it was generally a bad idea in the end.  It's
over-complicating things and causes some code bloat for very little
useful features.  There are corner use cases where it makes things a
bit easier e.g. when building a modified container image locally or
on an alternative registry, but handling the full image path isn't
such a big deal.

Validating the image name is also not strictly required IMHO as the
underlying tools e.g. Podman or Docker will report any problems
anyway.  I'll see if we can still have just the regex validation in
place without the extra CLI options, maybe send an RFC but if that's
also bloating the code then I would probably just drop this series
altogether.

As a collateral benefit, I basically ended up with a small Python
package to parse container image names so I might tidy that up and
submit it to PyPI :)  Or upstream it in an OCI toolbox or something.
I haven't found any ready-to-use one, all the container runtimes have
their own independent implementation.

Looking ahead, the next item on my list is to improve out-of-tree
build support with the tool so I'll start tackling that soon.  And
the related topic of hosting reference images in a kernel.org
registry[1] is also making some progress after some discussions at
Kernel Recipes and Plumbers too.  We've reached a consensus with
several key maintainers so we now need to find a way to land this.

Best wishes,
Guillaume

[1] 
https://lore.kernel.org/all/01a87de4-8de5-4ff0-941b-2e5932a3a19c@gtucker.io/

