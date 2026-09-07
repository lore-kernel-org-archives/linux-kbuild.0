Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD09478870;
	Mon,  7 Sep 2026 11:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780538; cv=none; b=UpuYyqNNCeL7712lDtqFGCx/2QMA5xbZcIky7y/qZhp37xgMhMw6XnZQbbrrXBY9vi1HW5CyoXPwo9I++iD0xq5+iJs0CrPSUbQoaxYj0i2WCIRp2AcEzSDy9rSqKokF/DNbLD9T+EIp/kv9qyIsNq65VWpJ2G+gvQi3TZVYUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780538; c=relaxed/simple;
	bh=4R0oW681/U498bcQXGtV5FfgxlhTh7wut+xWKFqIdIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bYUpVs9LMvmyMTlvMIqzUfBK7JYhPQAttoRfl2De2Ppksp9ghB2kmBmk3OTNal8T4DqHccMDTxDPydlPiF1aTSYoGOMQ6LOHxFHH0AleTUWEwEMjkvgbUEBo+yPS/XzaK5FULmWJsDJUHR6cjmlgH8lJ6Kc0KvQRBH2ivBuSDbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=T9dpmgIc; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="T9dpmgIc"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9AF53E83F;
	Mon,  7 Sep 2026 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1788780526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSrNw+Mw+QIUoy0T4F9WkDJEEONatr2//AJjEdYMWzs=;
	b=T9dpmgIc95c2enklCsXTocH/Me69usLRfAw4bBmF9gtvq5ABKILOzgrvwAB9BNfHpG0KaA
	HjmXwgw3zP+LGNhuKxhUtVg3La3krYkedHyaKVIPZe4dxp1SkDQXq7czfTdR3UPsBGtX84
	RLbPONsdKm+h3UCMxet/XcBXUXh6u09aOejpAbTb0dJ8O1jcKospkMy/9AVjVHQYv92whE
	G/gStsgPWpefxsgiiW0ADCq8JQFVsp0TJ6zi4woLfiR6XJOuBZQVqXbyiSf+L4ObHoDbIQ
	+EnN3KbNMHslI1LXsm7YGW1g46mqWaWM9FsDs7xEqw+F7QnnHMF6cUHNXYpCcA==
Message-ID: <f2dfede5-b54c-4bab-92d6-48249b429bc5@gtucker.io>
Date: Mon, 7 Sep 2026 13:28:44 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, automated-testing@lists.yoctoproject.org,
 "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <ed43b869-6fd4-4b00-8fd2-e9dd9aaf3349@gtucker.io>
 <20260903202700.GA3790602@ax162>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20260903202700.GA3790602@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Cause: dmFkZTGYZ0xusX7B3vtGEumXHWWs3taCaC0TRLuhSk1Xjf6hEIZALIUlCCS0I/nesxusF2897jbZGrlgFwkxPfIiN3hbvJorR29XIS+H4S+El4YU2yG+9hRWyTJ+3pK9GRyXCTnlmK/7IQ2Y48I43N1/ICy8CyHR2XQkI6fp2D5byzkek+kpmgXBPdlv29U1JGPVdwEUqukJ91D74TnOjoF95aSNSQ/x7z4KCVMXIHc8VtWSQaSURAEdU7c7bnS2aHvRKPKuSXPZvH7iJTIhUQsPRN/xK+UNgqABMI0YfW2kQ/7yBOLh4nMOrGIDYd5/yu2lhYsLNds07CYjJ3T/eYi9XF0Bju3NMjpYn83V55GZA5a7nnkrrBG4ltTywXEZxk4ihfddli+x8QeFf6erhRQQzczPzoEa8i/pPncQY8Kznfd57KKI+Sy4yVjRDlpgePmuc7balo2/Bvq1sL5jaBblKbqHXX4WmCoekfSW0pxq8Wqb+vtC/9beenO2XlVviVUGmktVt2d0ZEss8x6dtOdDPoXu4yeLmCGjJwIEAr1uFz2gEpZT4k+sZsFTkWUyABIaW9im46pQUhv/LXgUUSSme+chk9ugJxiSrqGG9ji9Kechtq7+C7XnZZiJMNnmsOPAlp9nmr2n+7XYEBjwXQQaE8/yEMtOj9g2/W0QI7sWrnnQ+Q
X-GND-State: clean
X-GND-Score: -100

On 03/09/2026 22:27, Nathan Chancellor wrote:
> On Wed, Sep 02, 2026 at 12:26:29PM +0200, Guillaume Tucker wrote:
>> So to recap, here's what I would suggest:
>>
>> * keep Python 3.10 for this series, continue discussion about minimum
>>   and optional version numbers tree-wide in other threads

Sorry I meant Python 3.11 as the minimum version for this series so
we can have TOML support from the standard library.

>> * drop registry config file option in v4 then add it in a follow-up
>>   series along with image name validation and parsing using regex

Done in v4 which I just sent, will send the follow-up once this
series is all done.

>> * leave TypeError exceptions as-is in this series, improve user
>>   experience and error handling altogether in another follow-up
> 
> Sure, I think this sounds fine. I tend to ignore existing issue comments
> from Sashiko when it comes to accepting a series, I would always prefer
> them to be handled in a separate series.

Thanks for confirming, makes sense.

Latest Sashiko review for the v4:

  https://sashiko.dev/#/patchset/68b14a76a4cb2e6437c869bab948983a98acffbd.1788779245.git.gtucker%40gtucker.io

The `env_file` comment is moot as the user should be able to trust
the config file provided.  It's exactly like the classic
docker-compose.yaml env_file use case in fact.

The other comment about injecting options in the image name is also
partly moot as the arguments passed to the subprocess wouldn't work,
still I'm going to be addressing this by validating the image name in
the follow-up series so that should then get resolved anyway.

Best wishes,
Guillaume

