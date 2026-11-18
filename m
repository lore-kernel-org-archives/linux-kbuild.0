Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795000502;
	b=eKLgGikrQH+jou2VTU83iTYojWLwD43Gcz1ioQmWGaIem9jZS15XitIgs4gw1PwAmn9u
	 o/Blfcq7I1ZfzFf03C3I08S8OD5IyYJ2KHuW881tzyPtC+Q6MAyxKVxnGdP5TGRL+NikC
	 D0fmdN6uoVXsvZtx6GrK4iykZjurMCz70IRkDuH6xIgF1VvPbJG+RKIDTFFNZVwcLLAgc
	 XMkcNLVLt1TuKaFv2x7ivLnnLPg9ypqt9GGv2vnSpltyrYPyDMybIBUxAIHi86P8OjqJY
	 lAGxbb+1X6L0HbR4y1/0QeWyIivHjgZ0JkuggnrE1vGEQj5vqZjSG8hxuX74lsqZCSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795000502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=6DH0KVmtxdJ4mUifFz/9FMzYO3ur54bwKg2YAmdDwWE=;
	b=Oeeh+lEu9Hz+5cGQITSuAB1TYLFks1zJsw3zNymufSJ5tssmLVXT4Mj6vSvKvSCbiiuZ
	 wPTfo1Y6y1EuDkCMft/I2qI+wucAVo5uYSn4Va8K/BbJZddZBh0An8UtwB3uZviB6Il0a
	 0A1sLovxYI1hitNLo2qYreZpGMb+x04wtTDwLHjJ7FKrLCTZf0P5rw/tcQti+vZ2xBhFH
	 v41GKheW6CqtpCfif1B9a6NKZv/33e79fiRnZIUBx4lgliG+ML98vMC0RUnqo2bS3EeCQ
	 jKDc+CFoSwGEcVLWXgmEm3j3Dxo0O29MI1q2gQ0nBBnuClwUNz3qvCKmG7wg6A/QyNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEg+AYQh;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E3B606A331
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 11:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E3B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oEg+AYQh
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so398071f8f.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Nov 2026 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795000501; x=1795605301; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DH0KVmtxdJ4mUifFz/9FMzYO3ur54bwKg2YAmdDwWE=;
        b=oEg+AYQhdqA61jWzO6wBSI87USRl4RigOLJYa5Z2CXgXY+u9E3Amkb07J1lFkPvlky
         bNH6BsquAoRqmThBRO3drjEcbnUXl6evUpX3DftN7oeQkT9SXawubzf8rppVNTYsfSmY
         lpbkIBpjI5bU4JIgJC2b2mq3wtY6IHZIFdCem+IotNNxN56bfi9pwk4oQRuAokzlmYTJ
         bJiggy6hA6ghD8W0xKP8gtDYI5EZ44nFHYOc+Zx65fL7kp02cnQoBZiwYr4XA1Z0Pcb5
         TT/d7ast9meiEo+fLvPM8BHOXK8zW3BP14tsb+aLM/D3Mqaef2OVawu5TSaQi5MIoTJh
         bM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795000501; x=1795605301;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DH0KVmtxdJ4mUifFz/9FMzYO3ur54bwKg2YAmdDwWE=;
        b=CJJ/rNmlj2W83RO9JoxR+EEicxI46nRKJz0CMqAL6hZlHHalDewgDIrdexYGpgUFes
         4k3icQX575MQwtGNRajil2NO8KJl9DWCLEi7pN5u4sdiBbD3mvz+j8sJoZ8jEmERlcT6
         xwwwrn9M+XgHeT/EO8gq1rePb40cthdiKZtZP67IBLbLSJxNIvbQoIjO8uJLpIu2bPlG
         0t7xa48cozplcA97pQts0vloxgs/Llr5UrlvY/yjWIhp4AeH/2QIYca2eFVL/xacPvwP
         xQ/y3wymhpNRwDNDrlTfI6u+pL9aXLqPyNBTTZhpUyIkT5lh+jRqboJ+blXQPXa32ujB
         BJ/A==
X-Forwarded-Encrypted: i=1; AL+hErENNLfdTv31zXm2csFqke7QS6+l8MKbpG/1Knux+aJ0OWpeBkONfAK0jBDj1YMSPDNfS1xwdFCaP+BZBgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nh2oIRWyjXhNU1I/y3Zq5JsasD3WBk6VmRSn9Lqft8vd7+1SU
	77hWDlHlrxqgoYBcYb70BAYhCPs9Kzc32kzndwqm4DAJDbhP6dewVKlcWUf1Kg==
X-Gm-Gg: AZFdTZc8ss+2B8It95zONmwhNXroFdYb42OGRsBPFey5wBbrB718TfEcaHYEAra7XAI
	MqAZYqmpGNvDwPYX6Mxqgvz4be0qy+36FypIqFYrfUwH6fjtdbUTcThYaSNiNbsmn4mUaA9FxOh
	Kyng6n+qQcie8yiJHdwUudbMcj42dFUnltFW/ReeHo6pX7NEJlWRQXicIkdrazoSBA4VXPsLfPb
	ICYsvYDf+j+LLFhzAvAAZWZqKOFaUR0Lcbxvt1BvakHyBMKmnSzTay49JSG+ngxlNTXnJ6NHYq+
	JrAAfRy74cFPa8RDoSskiizMJTH3hkp/2uz7wj+cXZu+BLCxaYRrqppkdltwW8kBMyEl//UmoVN
	iyYMqfNjhi9ip6yTGegdmVOgGTgprfUlIRlKc1TKSXTb1kdWmmzRCZJQH6H1IRd0EaGzZsGrck1
	qc6MDeJ7vpucSzbf7wVldNqVz113OmT0rmooQbKEIniCXnCFAHoMF7OGE2XlQHO2hpjnOY1041r
	NElzq4z95ZH4NulhDgaWSOCV20hltuUN3rKTzlI6PWaW8nZuziocZuC5o5gyPKnm243h6Mvvais
	JJS7X9k3WLgh/Xck137V5cB8In/iiJ+RKpAM5uOO5ZsiUGQWqM4BVlEee+Q4/h+yWlnUrCaSKiW
	SQauA/ldmpljU4457yDtlKZA40gCc3Sr7+SWgRnY=
X-Received: by 2002:a05:6000:4b1e:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4a63984a9dcmr4820215f8f.10.1795000500756;
        Wed, 18 Nov 2026 03:15:00 -0800 (PST)
Received: from [192.168.0.41] (bl22-190-205.dsl.telepac.pt. [2.83.190.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f21sm3965668f8f.38.2026.11.18.03.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 03:15:00 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f430727b-0ae4-4210-80d2-cef29109a863@gmail.com>
Date: Wed, 18 Nov 2026 11:14:59 +0000
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
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Voytik <voytikd@gmail.com>, Nicolas Schier <nsc@kernel.org>,
 Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20261117132513.52725-1-voytikd@gmail.com>
 <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>
 <20261118081025.GA671584@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261118081025.GA671584@ax162>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DEjnDSqXCUaZM19f19vV5pT6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DEjnDSqXCUaZM19f19vV5pT6
Content-Type: multipart/mixed; boundary="------------4WhGp4f0ehBKXWddaVMCg5Iu";
 protected-headers="v1"; hp="clear"
Message-ID: <f430727b-0ae4-4210-80d2-cef29109a863@gmail.com>
Date: Wed, 18 Nov 2026 11:14:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
To: Nathan Chancellor <nathan@kernel.org>
Cc: Dmitry Voytik <voytikd@gmail.com>, Nicolas Schier <nsc@kernel.org>,
 Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20261117132513.52725-1-voytikd@gmail.com>
 <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>
 <20261118081025.GA671584@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261118081025.GA671584@ax162>

--------------4WhGp4f0ehBKXWddaVMCg5Iu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/18/26 08:10, Nathan Chancellor wrote:
> On Tue, Nov 17, 2026 at 07:25:17PM +0000, Julian Braha wrote:
>> On 11/17/26 13:25, Dmitry Voytik wrote:
>>> +# If no '--file' was specified, use KBUILD_OUTPUT as the base if it =
exists
>>> +if [[ "$FN" =3D ".config" && -n "$KBUILD_OUTPUT" ]]; then
>> Right so this will give different results with:
>>     '--file .config'
>> and:
>>     '--file ./.config'
>>
>> but maybe that was intentional -- i.e. we're assuming a user passing
>> '.config' intends it to be '$KBUILD_OUTPUT/.config' while a user passi=
ng
>> './.config' would intend CWD/.config?
> It was intentional since I had figured they were passing the default
> value so they should get the default behavior. Maybe it would be better=

> to only do this when no '--file' value was provided period though to
> avoid some unexpected behavior?

All good, I think it's reasonable. Just wanted to confirm the intention

- Julian Braha

--------------4WhGp4f0ehBKXWddaVMCg5Iu--

--------------DEjnDSqXCUaZM19f19vV5pT6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCav2IswUDAAAAAAAKCRDElYPCBXNxIF2q
AP0ZpWOny+OS5jO4uJKuuNIxj7yHNBH5kNRGvz6S460DfAEA8aYa4Ojn8ELvoK+uj62fPziyGEse
NHrN4e0bq2AyzgA=
=6xHD
-----END PGP SIGNATURE-----

--------------DEjnDSqXCUaZM19f19vV5pT6--
