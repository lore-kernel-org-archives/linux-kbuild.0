Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D82F3CB55C;
	Fri, 28 Aug 2026 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898907; cv=none; b=OURZWALEfPnTXRFRx+83Gw9sF81Brs0Wlb2NnT0XF88JMoHSwXUyFSx5ETFAweBQ6tP+ltb4w39v93/gWChgWoRbSdMhOolNsLZKRwlv5+VckrY6OTawWOMY9U4+zCsIzkwcIRGMQJSUGlcyobchb2R06ShoiIiQkjKH34OX42o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898907; c=relaxed/simple;
	bh=pWR0M0huuKjSlYNVY7SPleyBelluXKAn6LFgxQJ6+zs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=a24w9PtRwC04gJd/afqjbIwxuLiGunssoDTpOBWrd+SLnt62N00QPkAjHaHsu8WSNacloNz0YvHaygptOzZDNhZ5PPa8ETOWeZscwUJzgZkUzdC3qseP8t2qV2zMir+tWVx1xMFg5XGDLx/lCTFiibwiBrC2yNJW+ssZJwKrg1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=HMWAD19D; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="HMWAD19D"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 716E11F6B5;
	Fri, 28 Aug 2026 06:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787898904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/iR1KweBzSxP9FGrzqA4ASiQODRWX7v13kODqXdEBp4=;
	b=HMWAD19D9tgEsCaspKYQ6uks87eq0Hup55ceUY2MmjhMGE0DrDLaC6YhZHBKPCkoxQYOtS
	fM6xFvhtxvfNdUtfEXoN+kIXlFVTa2mvLoYA+bgUxiW9ZZdjVDFBCitz39fr+sbg2wEEIZ
	OITX2E5vjrSFj/iud4Gc5zOer+u1LAGE2AzuGSOJv8vfwvaODnOPqhrYKH6/RxJdm9+fz3
	8kCaR/xQC8gD4k8XWGBabCERLupXNW05AsDPaI7p7CN2gRvRRyC2fSxiETQmowJwfHBacx
	pjwNAqv4xEbybHaSqPEkV2uOhayTHW53uQjNWWCkKPQcwMlQM6bBwJlOOyOBcg==
Message-ID: <be36c78e-6aa3-4efc-92d8-12bef33d8aa0@gtucker.io>
Date: Fri, 28 Aug 2026 08:35:01 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Documentation: dev-tools: update container.rst with
 config file
From: Guillaume Tucker <gtucker@gtucker.io>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <13dc85e4d0b1b1f6fcfc7782238b137061f2dd7c.1787565460.git.gtucker@gtucker.io>
 <fa01a427-a73b-460b-9b11-d2e92cb8ea9a@gtucker.io>
Content-Language: en-US
In-Reply-To: <fa01a427-a73b-460b-9b11-d2e92cb8ea9a@gtucker.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTGx+fqQXmHy5y5DH2/LlayKyk8jrqn8lUcNZUv2u6cFSI7RDLKROvNyW8KGCfWSE+zularg4VFK5LWVL2RUXhw4mLigroXMhg8FmjBTr7igqACMtYVF8jwbdVNK3jouJI9QiOLPZpCLTTy7ko2m/E4T1Qt0BGWSLIwLlrGAPmZGLPLzT0Zo6NylT0JlqQLTTXcEfcpL34Ipns7zIiO8SAnHHzel82JV3QEc6kxYa0NNHVHhoLcBLA+9Fa1x7My66EzsRa9EEIxVt1Xkcjy4fyyzesFY8on/0DPl1YdGTjQc246Hc32MypWkPeyEAwThTKu7spPG0Ngf8ihnPFnhDUlZZZvyzglBkc+wTRYC0Cnd8d1wy8ksUVi8iX4uPeNrpIuNQ+hAtjC8OBhDHWINSu3evHBe1opVz3WbO9JyNW++gZxnrljqgZ6+s/zzd+wLoUMcRkme0bWjb98BQGV1glfsU3MgV6s0IOO4qAW2PtYqO6EbjwYfUjeFYbsR4CBkjC9nWiafduv7B1qmX3GXTCD/uNzpuLZz9ZjKyAKwBzRAy1B+d+y2awQy2oTbw0SBqQHM81YWgbgcBbU4+YwNu6vf+W6aOmlOg/Uu4JpqU7Xpz4+hzeodbXs4hx4hWWHmU+nrpd1YbiP2xaGkUWwsgbTm7lK/0zQikel2GKGBHzx94A
X-GND-State: clean

On 24/08/2026 12:55 pm, Guillaume Tucker wrote:
> On 24/08/2026 12:05, Guillaume Tucker wrote:
>> +By default, the tool will look for configuration a file named
>> +``.container.toml`` in the current working directory.  If not found, it will be
> 
> Sorry, a small typo crept in:
> 
> -By default, the tool will look for configuration a file named
> +By default, the tool will look for a configuration file named

I just sent a v2 with this fix.

Guillaume

