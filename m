Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8463502A9;
	Sat, 29 Aug 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787994182; cv=none; b=U/afQ1Nuk5eB+R5zulh0Rm6t9B96RikqhS6858+m7xmUOHbupEZRjmoG+x+UObcVLBBPrTxPi7CPSzRRONoNfN32BMLiuGYyA8HkF3P13ofUbGj6AUXD7nWnJIjGwglr/wUtan0BAARbxR2SGR5FedpBBfk2Qtlg3a5s2PmwGfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787994182; c=relaxed/simple;
	bh=jEIKQgSNiXdm+fNuAyeKlmdiaBDspiGGjX8c9Rjjsr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A83ETsCtkz0QSIoCK/u6MIBzxqeWij9AGYilVPjKpol5N96qbrpEUiP/vGk3ADoOwYxszqweMaaY4SxbDpBeAChRify9/JhVeEXRevR7QTMh442OmfVeSM/Qg9kSZCAj3FArNdz+JZOiGt+H3inpCHKcRD4YeFU+vC75LCfXnAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=anR1vMks; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="anR1vMks"
Received: by mail.gandi.net (Postfix) with ESMTPSA id CC2883EC03;
	Sat, 29 Aug 2026 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1787994172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNDTOYX+Alcwl8fq0Y/kyG2b3q+u6oLf2cqqDD9VlRE=;
	b=anR1vMksCcdcjDImtUdbTFMp8hsE2h7s9wTp4Go3LrhRs7by/E54qGXJHvTqYFaX8TrA0c
	1Pxmm4SBZCPFZCw4t6Y7wFYT8w7C9J4NX8WhAt/QtgaT9eyqd1fLXKtP6Jx0OqWQBzXFpz
	x/YRlxfYmRXQpf9bN6kVLdzeomoXh5gMrNFB//TCKfdZvd5nIv9EJtxBZPDqFpuZxvTH12
	oDfEFt1cAeiz2jTnY48JDauadmMZrlvLINXBn7sjezbuiiveZlzQ4Gy6iVs7PZOB40Rvl4
	FB2KfE5r4loca4CreLL+gkhEwEvEfyu/3wXa/jRsfGh5p2nhsKo7z8Vo0ymSEA==
Message-ID: <9a3eabd1-4057-45cf-99b9-9c3c1b6260d3@gtucker.io>
Date: Sat, 29 Aug 2026 11:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts: add TOML config to container tool
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 automated-testing@lists.yoctoproject.org,
 "kernelci lists.linux.dev" <kernelci@lists.linux.dev>
References: <7d8ba914cd174d716340bb2b88723bef0f330627.1787565460.git.gtucker@gtucker.io>
 <apG3hwaPA8f7SJeI@levanger> <b45e7864-928c-4b3c-aa62-64f4f63d85c7@gtucker.io>
 <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <CANiq72k6T9Y_Vubih6pFMQBxju2xQq0VQkCXT1WL0qSyCXKxyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-Score: -100
X-GND-Cause: dmFkZTFWBQihkoJMTIE/mv9EszDwvkztOeC7orN5Cjkcw2DG26ZprwrwIJYUTzVG8t3ZdtynxeITFUpg8ofrB+dJvCmN2gVYOeGDX7lzC1AlKF6foAGJYhLKsEQ+yyIlAPXzUK8g1GMVnu2HoNG45fGSbXL9TBKWsdTcj6jUW+phskt2JASpvKa19ZfCIl7pOkJF5unF1D9VBlUSSkJfcHUoQLKkFUGy2SFc/TmUk75wtrYEDK+nhuxe6zkY+CMOgStTWIhZ+/FmcH7m3JWTBlE6nkgZBY33uq+5sKTpx/DcQ3EmzNn+7Lp8pB47E7SGMzLLbERP5Jkbq0dq8rFZ2l9YmSf2MDWWyeQ1mqHzU2YGqUlyXWTk+/yycUUR6nsWMVn53Hvfrp2wouZmg0R3eCu0bsFg1qvMJqaWXr3xXQOwV5vaQyyXOgbQjpjyHpUg13r00Sv0PldZWPg/BnPlMOrgf1qnZ5uUQ7Y3du6q6UXzJ3ncbOyOdwV4WvBWwG+5WtAZmg+a9FqVNR6Ck1oo2adqQ1QmfmsEmH0HxZAQX1R5KlOgg3sOfCbqTIi6H67xS93LD2iVccO2i5eupR006mDGuDVrGfzkmNoT9BOqCEr8905K5/118lkNbxk/Ibwj0O2oWFAUXJoZWsqvqsfnqmiCH0qgdh4fcTAZR8iwl2Ck8vQy9g
X-GND-State: clean

On 28/08/2026 7:35 pm, Miguel Ojeda wrote:
> On Fri, Aug 28, 2026 at 7:25 PM Guillaume Tucker<gtucker@gtucker.io> wrote:
>> It states Python 3.9 which was already older than the 3.10 minimum
>> set when the container tool was merged.  Also my understanding is
>> that it's not a hard requirement for all the kernel tools, only for
>> building and producing a functioning kernel.  If I misunderstood this
> I didn't check at the moment, but at least back when the "(optional)"
> tag was removed, it was only required for certain configurations from
> what I understand (I am not sure why the tag was removed).

See "bc20c56e98e0 docs: changes: better document Python needs"

Also it's explained briefly in the docs here:

   https://www.kernel.org/doc/html/latest/process/changes.html#python

So I guess that if it's needed for at least one build configuration,
then it's not optional anymore.

Guillaume

